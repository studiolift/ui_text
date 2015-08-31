require_dependency "ui_text/application_controller"

module UiText
  class EntriesController < ApplicationController
    def index
      @locale_hash = locale_hash

      @entries = @locale_hash.sort.map do |k, v|
        Entry.where(locale: locale, key: k)
             .first_or_initialize
      end
    end

    def show
      @locale_hash = locale_hash

      @entry = Entry.where(locale: locale, key: key).first_or_initialize
    end

    def create
      @entry = Entry.new locale: locale, key: key, value: params[:entry][:value]

      if @entry.save
        redirect_to redirect_path, notice: 'Entry was successfully created.'
      else
        render :show
      end
    end

    def update
      @entry = Entry.find_by locale: locale, key: key

      if @entry.update entry_params
        redirect_to redirect_path, notice: 'Entry was successfully updated.'
      else
        destroy
      end
    end

    def destroy
      @entry = Entry.find_by locale: locale, key: key

      @entry.destroy

      redirect_to redirect_path, notice: 'Entry was successfully destroyed.'
    end

    private

    def redirect_path
      entries_path locale: locale
    end

    def locale_hash
      LocaleHash.new(locale: locale).to_h
    end

    def locale
      params[:locale]
    end

    def key
      params[:key]
    end

    def entry_params
      params.require(:entry).permit(:value)
    end
  end
end
