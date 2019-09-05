Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 294D5A97C1
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 02:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF52D89C9A;
	Thu,  5 Sep 2019 00:56:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780079.outbound.protection.outlook.com [40.107.78.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74F389C9A
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 00:56:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awCVUh6Zi1Fd53uTIHg5JMiYMabSI56bjyNxdRO8Fic2mIbHnAcGd0y3qnDMaGACh02W35ntHzcI/THnkkqKj0EHS6uQb/uZUSFU+jsgwQ8PTlgm6fRnlV1QwK4FBinMxdB9yfVjRSq4VwioXUtNb4WbZP4A26mgFv9kYCmfRUsK+3x/9T7kd/oeTc6FPfitGNGV+lH/1KGfhmEX4I4x2FpEh5Hqx4jeyFoOqNWBYZgR2YuiwzQChOhbMcfRxr6zo25V457jFpo7tpdi5DM8Cm9xdyl9x7RRxNdryH7liDiSdLpQD6ncJRXAwlgRdOBU0IpEYPxG23loDl75j8jvXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeTg1qEAOcqg+NtwvCjeu3ldlvf8QMit4RyFAj6qEb4=;
 b=RQcwjvCp3/1LgJYH/bOnvgEwDozTNf+Tvc0MqA60MNER9tfa7yaHvAM/glN2NrmuGIhVORbJWVsp49vcDe6IQhzX40RkXRrVBjSzM3zT+Tw/tjlWGgd5kQjs+SoSdyCZTEKvx3QZcyeD5f3klA5ZsEg8wPK8oiLi2pc4AmgFHjsPXdX7e8Res4hn3vijU89wIodvnOSSiW2BXpTCMVokuduampzKI3Ab16gEuxB4xLvLjlxgZBjrIteKGtLjSkDTf6Gif2zlwcvrKE4ukHJitbCV+YpNz0TEmYFPjzk0KTXlIS/Oe1kZagpoAMIAXI8kSZHuvBejoN9yLbTvPCyzSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3838.namprd12.prod.outlook.com (10.255.237.95) by
 MN2PR12MB4143.namprd12.prod.outlook.com (10.255.224.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Thu, 5 Sep 2019 00:56:56 +0000
Received: from MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::a056:2e67:6f45:31a]) by MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::a056:2e67:6f45:31a%5]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 00:56:56 +0000
From: "Liu, Aaron" <Aaron.Liu@amd.com>
To: "Li, Roman" <Roman.Li@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/display: Add stereo mux and dig programming calls
 for dcn21
Thread-Topic: [PATCH] drm/amd/display: Add stereo mux and dig programming
 calls for dcn21
Thread-Index: AQHVY2nQ3xIjNZ4ADkuHuQ/B0EcOxaccLg5A
Date: Thu, 5 Sep 2019 00:56:56 +0000
Message-ID: <MN2PR12MB38381556BD5AF70F1DF81539F0BB0@MN2PR12MB3838.namprd12.prod.outlook.com>
References: <1567633392-26602-1-git-send-email-Roman.Li@amd.com>
In-Reply-To: <1567633392-26602-1-git-send-email-Roman.Li@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 301aa31e-aef3-4f18-7a63-08d7319bf34a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4143; 
x-ms-traffictypediagnostic: MN2PR12MB4143:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4143A14E96D090A06C4F8705F0BB0@MN2PR12MB4143.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:331;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(13464003)(189003)(199004)(54906003)(3846002)(6116002)(2906002)(66066001)(74316002)(86362001)(305945005)(7736002)(316002)(966005)(55016002)(66476007)(66556008)(64756008)(66446008)(66946007)(76116006)(486006)(5660300002)(2501003)(8936002)(476003)(256004)(71200400001)(71190400001)(14444005)(229853002)(81166006)(81156014)(8676002)(53546011)(7696005)(76176011)(6436002)(6506007)(14454004)(110136005)(4326008)(53936002)(478600001)(11346002)(446003)(6246003)(52536014)(26005)(99286004)(6306002)(9686003)(25786009)(186003)(33656002)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4143;
 H:MN2PR12MB3838.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WlFMmUYPxXokte2AQ024P3NoKZsuKn+v4RXLoZPJ5O4E8xNUNMY/BJVaCpsVf40UJ6FpAbA8qxWNddsxM4qDSotMqibcyuYiJATdIA+gp5FM6Yzvhg6Uu3yNc1VWz5JImuZxNAxaaqYv+9a9T7zoS+SPO27FlkUKDFospWD3OpbzyMEAalt0Stj+xeD2psViaF7cQSaWLUuS5I6a/9Mf3WeHBQ/wVx1gtwNwpOZlqIFgvvdLasP5JfkgxUIbGL5Z9nk411nG78Z+8MNCta9DxUugsg78IwppXGCiLJiizpIXYPKWLSRKV0htV9YFsgFyJVVxPZNIYuJNR2xRyI5L1ePZVTK9bJnxotFqygskio/P4dX8s1JOX+A2xNCJDJV15l7xreZlwFwzErsE+hovwOzCf++YZWRXrBaM128MZOQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301aa31e-aef3-4f18-7a63-08d7319bf34a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 00:56:56.6071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BF9Ne13X+oeMCMxkiFIJjL5y8oL1x3ypi0gGPjyZhjo/eV23LehwHggVVD4bdm4f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4143
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeTg1qEAOcqg+NtwvCjeu3ldlvf8QMit4RyFAj6qEb4=;
 b=LK5tEyuHf0jdO1m9eu9JLqFIPBzAw5+UBFgLzuBIxea7nmOwxFs4VT0w0kdxAPk409apMxvh3ZxRzM8T6RtOqh0aWoT98hTuW9fIplrYUoSrRD1nG4preWfb8fCvk4/1XlYDBUf3dhh0PupfdiLTBteq0nzhRI1WpXMgR7IKXCI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Aaron.Liu@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Roman" <Roman.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IEFhcm9uIExpdSA8YWFyb24ubGl1QGFtZC5jb20+DQoNCkJSLA0KQWFyb24gTGl1
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IFJvbWFuLkxp
QGFtZC5jb20NCj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciA1LCAyMDE5IDU6NDMgQU0NCj4g
VG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBXZW50bGFuZCwgSGFycnkg
PEhhcnJ5LldlbnRsYW5kQGFtZC5jb20+OyBMaXUsIEFhcm9uDQo+IDxBYXJvbi5MaXVAYW1kLmNv
bT47IExpLCBSb21hbiA8Um9tYW4uTGlAYW1kLmNvbT47IEh1YW5nLCBSYXkNCj4gPFJheS5IdWFu
Z0BhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyDQo+IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQu
Y29tPjsgTGFraGEsIEJoYXdhbnByZWV0DQo+IDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWQvZGlzcGxheTogQWRkIHN0ZXJlbyBtdXggYW5kIGRp
ZyBwcm9ncmFtbWluZw0KPiBjYWxscyBmb3IgZGNuMjENCj4gDQo+IEZyb206IFJvbWFuIExpIDxS
b21hbi5MaUBhbWQuY29tPg0KPiANCj4gW1doeV0NCj4gVGhlIGVhcmxpZXIgcGF0Y2ggIkhvb2sg
dXAgY2FsbHMgdG8gZG8gc3RlcmVvIG11eCBhbmQgZGlnIHByb2dyYW1taW5nLi4uIg0KPiBkb2Vz
bid0IGluY2x1ZGUgdXBkYXRlIGZvciBkY24yMS4NCj4gDQo+IFtIb3ddDQo+IEFsaWduIGRjbjIx
IGdwaW8gc2V0dGluZ3Mgd2l0aCB1cGRhdGVkIHN0ZXJlbyBjb250cm9sIGludGVyZmFjZS4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFJvbWFuIExpIDxSb21hbi5MaUBhbWQuY29tPg0KPiAtLS0NCj4g
IC4uLi9hbWQvZGlzcGxheS9kYy9ncGlvL2RjbjIxL2h3X2ZhY3RvcnlfZGNuMjEuYyAgIHwgMzgN
Cj4gKysrKysrKysrKysrKysrKysrKystLQ0KPiAgLi4uL2FtZC9kaXNwbGF5L2RjL2dwaW8vZGNu
MjEvaHdfdHJhbnNsYXRlX2RjbjIxLmMgfCAgMyArLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNiBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdA0KPiBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9ncGlvL2RjbjIxL2h3X2ZhY3RvcnlfZGNuMjEuYw0K
PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9ncGlvL2RjbjIxL2h3X2ZhY3Rvcnlf
ZGNuMjEuYw0KPiBpbmRleCAzNDQ4NWQ5Li44NTcyNjc4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9kY24yMS9od19mYWN0b3J5X2RjbjIxLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vZGNuMjEvaHdfZmFjdG9y
eV9kY24yMS5jDQo+IEBAIC0zNSwxMiArMzUsMTAgQEANCj4gDQo+ICAjaW5jbHVkZSAiaHdfZmFj
dG9yeV9kY24yMS5oIg0KPiANCj4gLQ0KPiAgI2luY2x1ZGUgImRjbi9kY25fMl8xXzBfb2Zmc2V0
LmgiDQo+ICAjaW5jbHVkZSAiZGNuL2Rjbl8yXzFfMF9zaF9tYXNrLmgiDQo+ICAjaW5jbHVkZSAi
cmVub2lyX2lwX29mZnNldC5oIg0KPiANCj4gLQ0KPiAgI2luY2x1ZGUgInJlZ19oZWxwZXIuaCIN
Cj4gICNpbmNsdWRlICIuLi9ocGRfcmVncy5oIg0KPiAgLyogYmVnaW4gKioqKioqKioqKioqKioq
KioqKioqDQo+IEBAIC0xMzYsNiArMTM0LDM5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGRjX3No
X21hc2sgZGRjX21hc2tbXSA9IHsNCj4gIAlERENfTUFTS19TSF9MSVNUX0RDTjIoX01BU0ssIDYp
DQo+ICB9Ow0KPiANCj4gKyNpbmNsdWRlICIuLi9nZW5lcmljX3JlZ3MuaCINCj4gKw0KPiArLyog
c2V0IGZpZWxkIG5hbWUgKi8NCj4gKyNkZWZpbmUgU0ZfR0VORVJJQyhyZWdfbmFtZSwgZmllbGRf
bmFtZSwgcG9zdF9maXgpXA0KPiArCS5maWVsZF9uYW1lID0gcmVnX25hbWUgIyMgX18gIyMgZmll
bGRfbmFtZSAjIyBwb3N0X2ZpeA0KPiArDQo+ICsjZGVmaW5lIGdlbmVyaWNfcmVncyhpZCkgXA0K
PiAre1wNCj4gKwlHRU5FUklDX1JFR19MSVNUKGlkKVwNCj4gK30NCj4gKw0KPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBnZW5lcmljX3JlZ2lzdGVycyBnZW5lcmljX3JlZ3NbXSA9IHsNCj4gKwlnZW5l
cmljX3JlZ3MoQSksDQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGdlbmVyaWNf
c2hfbWFzayBnZW5lcmljX3NoaWZ0W10gPSB7DQo+ICsJR0VORVJJQ19NQVNLX1NIX0xJU1QoX19T
SElGVCwgQSksDQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGdlbmVyaWNfc2hf
bWFzayBnZW5lcmljX21hc2tbXSA9IHsNCj4gKwlHRU5FUklDX01BU0tfU0hfTElTVChfTUFTSywg
QSksDQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgdm9pZCBkZWZpbmVfZ2VuZXJpY19yZWdpc3RlcnMo
c3RydWN0IGh3X2dwaW9fcGluICpwaW4sIHVpbnQzMl90DQo+ICtlbikgew0KPiArCXN0cnVjdCBo
d19nZW5lcmljICpnZW5lcmljID0gSFdfR0VORVJJQ19GUk9NX0JBU0UocGluKTsNCj4gKw0KPiAr
CWdlbmVyaWMtPnJlZ3MgPSAmZ2VuZXJpY19yZWdzW2VuXTsNCj4gKwlnZW5lcmljLT5zaGlmdHMg
PSAmZ2VuZXJpY19zaGlmdFtlbl07DQo+ICsJZ2VuZXJpYy0+bWFza3MgPSAmZ2VuZXJpY19tYXNr
W2VuXTsNCj4gKwlnZW5lcmljLT5iYXNlLnJlZ3MgPSAmZ2VuZXJpY19yZWdzW2VuXS5ncGlvOyB9
DQo+ICsNCj4gIHN0YXRpYyB2b2lkIGRlZmluZV9kZGNfcmVnaXN0ZXJzKA0KPiAgCQlzdHJ1Y3Qg
aHdfZ3Bpb19waW4gKnBpbiwNCj4gIAkJdWludDMyX3QgZW4pDQo+IEBAIC0xODEsNyArMjEyLDgg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBod19mYWN0b3J5X2Z1bmNzIGZ1bmNzID0gew0KPiAgCS5n
ZXRfaHBkX3BpbiA9IGRhbF9od19ocGRfZ2V0X3BpbiwNCj4gIAkuZ2V0X2dlbmVyaWNfcGluID0g
ZGFsX2h3X2dlbmVyaWNfZ2V0X3BpbiwNCj4gIAkuZGVmaW5lX2hwZF9yZWdpc3RlcnMgPSBkZWZp
bmVfaHBkX3JlZ2lzdGVycywNCj4gLQkuZGVmaW5lX2RkY19yZWdpc3RlcnMgPSBkZWZpbmVfZGRj
X3JlZ2lzdGVycw0KPiArCS5kZWZpbmVfZGRjX3JlZ2lzdGVycyA9IGRlZmluZV9kZGNfcmVnaXN0
ZXJzLA0KPiArCS5kZWZpbmVfZ2VuZXJpY19yZWdpc3RlcnMgPSBkZWZpbmVfZ2VuZXJpY19yZWdp
c3RlcnMNCj4gIH07DQo+ICAvKg0KPiAgICogZGFsX2h3X2ZhY3RvcnlfZGNuMTBfaW5pdA0KPiBk
aWZmIC0tZ2l0DQo+IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vZGNuMjEv
aHdfdHJhbnNsYXRlX2RjbjIxLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Z3Bpby9kY24yMS9od190cmFuc2xhdGVfZGNuMjEuYw0KPiBpbmRleCBhZDdjNDM3Li5mYmI1OGZi
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9kY24y
MS9od190cmFuc2xhdGVfZGNuMjEuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZ3Bpby9kY24yMS9od190cmFuc2xhdGVfZGNuMjEuYw0KPiBAQCAtNTgsNyArNTgsNiBA
QA0KPiAgI2RlZmluZSBTRl9IUEQocmVnX25hbWUsIGZpZWxkX25hbWUsIHBvc3RfZml4KVwNCj4g
IAkuZmllbGRfbmFtZSA9IHJlZ19uYW1lICMjIF9fICMjIGZpZWxkX25hbWUgIyMgcG9zdF9maXgN
Cj4gDQo+IC0NCj4gIC8qIG1hY3JvcyB0byBleHBlbmQgcmVnaXN0ZXIgbGlzdCBtYWNybyBkZWZp
bmVkIGluIEhXIG9iamVjdCBoZWFkZXIgZmlsZQ0KPiAgICogZW5kICoqKioqKioqKioqKioqKioq
KioqKi8NCj4gDQo+IEBAIC03MSw3ICs3MCw3IEBAIHN0YXRpYyBib29sIG9mZnNldF90b19pZCgg
IHsNCj4gIAlzd2l0Y2ggKG9mZnNldCkgew0KPiAgCS8qIEdFTkVSSUMgKi8NCj4gLQljYXNlIFJF
RyhEQ19HRU5FUklDQSk6DQo+ICsJY2FzZSBSRUcoRENfR1BJT19HRU5FUklDX0EpOg0KPiAgCQkq
aWQgPSBHUElPX0lEX0dFTkVSSUM7DQo+ICAJCXN3aXRjaCAobWFzaykgew0KPiAgCQljYXNlIERD
X0dQSU9fR0VORVJJQ19BX19EQ19HUElPX0dFTkVSSUNBX0FfTUFTSzoNCj4gLS0NCj4gMi43LjQN
Cj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+
IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
