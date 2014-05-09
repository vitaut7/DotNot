module System._Interface.IAppDomainSetup;


public interface IAppDomainSetup
{
	@property
	{
		string ApplicationBase();
		void ApplicationBase(string);

		string ApplicationName();
		void ApplicationName(string);

		string CachePath();
		void CachePath(string);

		string ConfigurationFile();
		void ConfigurationFile(string);

		string DynamicBase();
		void DynamicBase(string);

		string LicenseFile();
		void LicenseFile(string);

		string PrivateBinPath();
		void PrivateBinPath(string);

		string PrivateBinPathProbe();
		void PrivateBinPathProbe(string);

		string ShadowCopyDirectories();
		void ShadowCopyDirectories(string);

		string ShadowCopyFiles();
		void ShadowCopyFiles(string);
	}
}