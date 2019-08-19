Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049D991E45
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 09:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA896E0AA;
	Mon, 19 Aug 2019 07:48:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680054.outbound.protection.outlook.com [40.107.68.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620FF6E0AA
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 07:48:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpGh/I8Aw2UcKYes/oSiLhXlo4PWzhxKCNY7sgVC1ZAwPxMlCBYzabOX1Qlv01kKpHQVSGDvSysIBR3he19bH8HDw1SApvqtQX58FBd4kFQQmw8BUtV6iIv7ZNGhMe5txsk+DzPnCrDap2qNj165ucdzIqSay4997ytzhK3mcOH86o+0awEWBvBxsCceyz3lbOR/Z4nrLXhbanWI0mR43txU1hR52CaTY3He4NEHfCffTishHDMy2oI/skPESRolkuf0vGcZHCSYQCA0T6uBj0VvvkKnvRgQsIK9ccjodqdA+dtQSOKPvH4Ke1JyIr593lCkldbMXoC4MEkecnYnYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMDHmCwlB2wMYs1ijSsqPhXkJ8xCWYrVwBKM6tCizPs=;
 b=AkBIUQ8lTJq3JekcewokWB626FRbh/SuWOMHC8UhQnQIqCm9hAjmdQEr+UXy3je0rg6QLDUZ4dzjjhEUFXbAL2DdZHFQlkkOaKTR9VOPQqiNDkJqGHPx4+b/qpiPHvqO6KykKgXbOxGdtABri///ptBxNwDrQd3o+wsi1NsucvK3A/fMOWNS9KkMbD8YDcpHDDHEeDZiFjOW6C9jJKWBYZ5BMO431MCgTtY7WrS95UMxP++vpCIoO+yTJikFuTXgzLuAwOqEteJQEOoue1khKva+AN9djIW5BIr2Hi53JeM9UJ2n4FrGZX6y9p6zfjE+owoTNaZ5bv1NiEQaZEZXlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.177.126.83) by
 BYAPR12MB3240.namprd12.prod.outlook.com (20.179.93.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Mon, 19 Aug 2019 07:48:01 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::3d45:d2bc:5fa6:6ab5]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::3d45:d2bc:5fa6:6ab5%6]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 07:48:01 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>, "Cui,
 Flora" <Flora.Cui@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>
Subject: RE: [PATCH libdrm] amdgpu: add mmhub ras inject unit test
Thread-Topic: [PATCH libdrm] amdgpu: add mmhub ras inject unit test
Thread-Index: AQHVVCJkTXF7fKGGD0y9yrf7bEc/4Kb9np0AgAQvmsCAAETggIAAAp/w
Date: Mon, 19 Aug 2019 07:48:00 +0000
Message-ID: <BYAPR12MB2806E142EFAE7C395A7F60D1F1A80@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <20190816110401.11069-1-guchun.chen@amd.com>
 <b6cde318-e453-8a89-095c-69708f0981ef@gmail.com>
 <BYAPR12MB280662C3A47CA31DC1790A3AF1A80@BYAPR12MB2806.namprd12.prod.outlook.com>
 <59701e8a-cc27-95d7-97f3-2d5867d0bc40@amd.com>
In-Reply-To: <59701e8a-cc27-95d7-97f3-2d5867d0bc40@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 795ae3ed-3c9e-4d97-0400-08d724798f5f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3240; 
x-ms-traffictypediagnostic: BYAPR12MB3240:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3240F4F08E107CFF29CA8EBCF1A80@BYAPR12MB3240.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(52314003)(13464003)(199004)(189003)(110136005)(33656002)(2906002)(316002)(3846002)(6116002)(2501003)(53546011)(99286004)(7696005)(8936002)(74316002)(26005)(66066001)(102836004)(81166006)(81156014)(8676002)(76176011)(7736002)(25786009)(6506007)(478600001)(186003)(14454004)(5660300002)(52536014)(76116006)(66946007)(66446008)(64756008)(66556008)(66476007)(256004)(71200400001)(66574012)(71190400001)(6436002)(6246003)(53936002)(4326008)(86362001)(229853002)(11346002)(305945005)(9686003)(486006)(476003)(55016002)(6636002)(446003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3240;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4h0Dy9vj7rt9cR4YtQtBsp34sGsum6x4ir+ErDdldez89167Ev4ZdHnSjWS/L9XS6GC4k0S1RizNzEkFhpvtr1BGj4JNGp+76oa8BKjQDGSmdiXXI4IFTfUZyIz/Ohz+NdzVK5lifYpLhZnGimyADemFIDaZKlsCr7cLoLijkXOgHLuvpIIKqDwNTbzFJQRzywblYFhtKJ8K3l4a51bJv6w/MkcWYn0lKgbKRVwShlru4qoTJbx1EyA6xmka0JSlmcBAMf4jqK4l6vEpxH1m9NsWV9mUA2dt4CtBvMpgrEQCJhdZPUsUysVqGqoT+YN4pqpNpGSgrzlD0NYnflxlGMitoboEnpuOLhC8VUXBjRbBZt2DBYW1QI7s1g8dSrWpE/UGxaraPZNBMhPw7rntLk6/SfkGbJP8rv2ZyU6S5U0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 795ae3ed-3c9e-4d97-0400-08d724798f5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 07:48:00.9836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AuZnfZol+abpd+j0/tZS562IfuBH/7cHM1tATKVqH01d67I2Eql+SWSje+JQ7PfQe8I3m3239djuypwPzgEgkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3240
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMDHmCwlB2wMYs1ijSsqPhXkJ8xCWYrVwBKM6tCizPs=;
 b=UO1YJnUrBxGeNvcuxq5FJML2A+3gqMvgMknyrRKCi9QTKSWl3uuTvDRIDW4Mvpjn+eOPY0t/hhd3DrsI/MdAYErQ8DQvt8zWnGYNKVAfeQlXoNZ32DmEN/I1yJ4zgDrVpLkFnuUKF3IxDtwWfHPGFEjJIg5Zad3XhUA7QNDEnxs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Li, Candice" <Candice.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLA0KDQpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbi4NClJlZ2FyZGluZyB0
aGUgY29uZmlndXJhdGlvbiBmaWxlIG1vdmluZyB0byB0ZXN0L2FtZGdwdSwgSSBhbSBmaW5lIHdp
dGggdGhpcy4NCg0KQnV0IHJlZyBwdXR0aW5nIGFsbCB0aGUgdGVzdHMgaW4gQyBjb2RlLCB0aG91
Z2ggaXQgbG9va3MgbGlrZSB0aGUgdW5pdCB0ZXN0IGNhbiBzdGF5IHNlbGYgY29udGFpbmluZywg
YnV0IHdpdGhvdXQgb25lIGluZGVwZW5kZW50IGNvbmZpZ3VyYXRpb24gZmlsZSwgdXNlciB3aWxs
IGZpbmQgaXQncyBpbmNvbnZlbmllbnQgd2hlbiBwZXJmb3JtaW5nIHRoZSB0ZXN0cy4NCkZvciBl
eGFtcGxlLCBpZiB3ZSBtb3ZlIGFsbCBSQVMgaW5qZWN0IHRlc3RzIGludG8gQyBjb2RlLCBob3dl
dmVyLCBpZiB0aGUgdXNlciBvbmx5IGNhcmVzIHRoZSBSQVMgdW5pdCB0ZXN0IGluIGNlcnRhaW4g
bW9kdWxlL3N1Ym1vZHVsZSB0ZXN0LCBoZS9zaGUgd291bGQgbm90IGxpa2UgdG8gc2VlIGluamVj
dCB0ZXN0cyBpbiBhbGwgbW9kdWxlcyBydW4gYWZ0ZXIgbGF1bmNoaW5nIGFtZGdwdV90ZXN0LCBz
byBpdCdzIG5vdCBmcmllbmRseSB0byB1c2VyLg0KQW55d2F5LCB5b3VyIHN1Z2dlc3Rpb24gc3Rp
bGwgbWFrZXMgc2Vuc2UsIGFzIGFtZGdwdV90ZXN0IHNob3VsZCBnZXQgcmlkIG9mIG90aGVyIGV4
dGVybmFsIHBhY2thZ2VzIGV4Y2VwdCBDVW5pdCBmcmFtZXdvcmsuDQoNClNvIHdlIHN0aWxsIHRo
ZSBiYWxhbmNlIGJldHdlZW4gYWJvdmUgdHdvIGNhc2VzOg0KMS4gTWFrZSBhbWRncHVfdGVzdCBz
ZWxmIGNvbnRhaW5pbmcgd2l0aG91dCBkZXBlbmRlbmN5IG9uIG90aGVyIGV4dGVybmFsIHBhY2th
Z2VzLg0KMi4gQWxsb3cgdXNlciBjYW4gY29uZmlndXJlIHRoZSB0ZXN0cyB3aGVuIHJ1bm5pbmcg
YW1kZ3B1X3Rlc3QuDQoNClRoZW4gdGhlIHBvc3NpYmxlIHNvbHV0aW9ucyBJIGNhbiBpbGx1c3Ry
YXRlIGFyZToNCjEuIFN0aWxsIGtlZXAgb25lIGNvbmZpZ3VyYXRpb24gZmlsZSwgYnV0IG5vdCBp
biBqc29uIGZvcm1hdC4gSXTigJlzIGEgbm9ybWFsIGNvbmZpZ3VyYXRpb24gZmlsZSwgd2Ugd2ls
bCBhZGQgY29kZSBpbiBhbWRncHVfdGVzdCB0byBwYXJzZSB0aGUgY29uZmlndXJhdGlvbiBmaWxl
LCBhbmQgcmVtb3ZlIGFsbCBqc29uIEFQSXMuDQoyLiBQdXQgYWxsIHRlc3RzIGluIGMgY29kZSwg
YW5kIGV4dGVuZCB0aGUgYXJncyB3aGVuIHJ1bm5pbmcgYW1kZ3B1X3Rlc3QsIHdoaWNoIHdpbGwg
YWxsb3cgdXNlciBjYW4gcnVuIHNwZWNpYWwgUkFTIHRlc3QuDQoNCkkgYW0gb3BlbmVkIHRvIGFi
b3ZlIHR3byBzb2x1dGlvbnMgb3Igb3RoZXIgbWlzc2VkIG9uZXMuDQoNClJlZ2FyZHMsDQpHdWNo
dW4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtvZW5pZywgQ2hyaXN0aWFu
IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+IA0KU2VudDogTW9uZGF5LCBBdWd1c3QgMTksIDIw
MTkgMzoxNCBQTQ0KVG86IENoZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT47IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0Bh
bWQuY29tPjsgTGksIERlbm5pcyA8RGVubmlzLkxpQGFtZC5jb20+OyBDdWksIEZsb3JhIDxGbG9y
YS5DdWlAYW1kLmNvbT47IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPg0KQ2M6IExpLCBD
YW5kaWNlIDxDYW5kaWNlLkxpQGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIGxpYmRybV0g
YW1kZ3B1OiBhZGQgbW1odWIgcmFzIGluamVjdCB1bml0IHRlc3QNCg0KSGkgR3VjaHVuLA0KDQpp
biB0aGlzIGNhc2UgdGhpcyBpcyBhIGJpdCBhd2t3YXJkIGltcGxlbWVudGVkLg0KDQpTZWUgdGhl
IGZpbGVzIGluIHRoZSBkYXRhIGRpcmVjdG9yeSBhcmUgZm9yIGluc3RhbGxhdGlvbiB0b2dldGhl
ciB3aXRoIHRoZSBsaWJkcm0gbGlicmFyeSBhbmQgTk9UIGZvciB0aGUgdW5pdCB0ZXN0cy4gUGxl
YXNlIG1vdmUgdGhlIGZpbGUgdG8gdGVzdHMvYW1kZ3B1IGluc3RlYWQuDQoNCkkgd291bGQgYWxz
byByZS1jb25zaWRlciB0aGlzIGFwcHJvYWNoIHNpbmNlIHdlIGludGVudGlvbmFsbHkgdXNlIHRo
ZSBDVW5pdCBmcmFtZXdvcmsgdG8gYXZvaWQgZGVwZW5kZW5jaWVzIG9uIGV4dGVybmFsIGxpYnJh
cmllcyBsaWtlIGpzb24gYW5kIGV4dGVybmFsIGZpbGVzLg0KDQpXZSBzaG91bGQgcHJvYmFibHkg
YmV0dGVyIGNvbmZpZ3VyZSB0aGUgdGVzdHMgZGlyZWN0bHkgaW4gdGhlIEMgY29kZSBzbyB0aGF0
IHRoZSB1bml0IHRlc3Qgc3RheXMgc2VsZiBjb250YWluaW5nLg0KDQpSZWdhcmRzLA0KQ2hyaXN0
aWFuLg0KDQpBbSAxOS4wOC4xOSB1bSAwNToxNiBzY2hyaWViIENoZW4sIEd1Y2h1bjoNCj4gSGkg
Q2hyaXN0aWFuLA0KPg0KPiBZZXMsIHdlIGFkZGVkIG9uZSBjb25maWd1cmF0aW9uIGZpbGUgbmFt
ZWQgImFtZGdwdV9yYXMuanNvbiIgZm9yIFJBUyBpbmplY3QgdW5pdCB0ZXN0IHRvIGRybSBtYXN0
ZXIgYnJhbmNoLg0KPiBUaGlzIHVuaXQgdGVzdCB3aWxsIGJlIG1haW50YWluZWQgdG8gaWxsdXN0
cmF0ZSBhbGwgdGhlIFJBUyB0ZXN0cyB3ZSBhYnNvbHV0ZWx5IHN1cHBvcnQgaW4gSVAgbW9kdWxl
cy9zdWJtb2R1bGVzLg0KPg0KPiBSZWdhcmRzLA0KPiBHdWNodW4NCj4NCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6
dW1lcmtlbkBnbWFpbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDE2LCAyMDE5IDc6MTIg
UE0NCj4gVG86IENoZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT47IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyANCj4gWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1k
LmNvbT47IExpLCBEZW5uaXMgDQo+IDxEZW5uaXMuTGlAYW1kLmNvbT47IEN1aSwgRmxvcmEgPEZs
b3JhLkN1aUBhbWQuY29tPjsgWmhvdTEsIFRhbyANCj4gPFRhby5aaG91MUBhbWQuY29tPg0KPiBD
YzogTGksIENhbmRpY2UgPENhbmRpY2UuTGlAYW1kLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCBsaWJkcm1dIGFtZGdwdTogYWRkIG1taHViIHJhcyBpbmplY3QgdW5pdCB0ZXN0DQo+DQo+IFdl
bGwgdGhpcyBkb2Vzbid0IGxvb2sgbGlrZSBDIHRvIG1lLiBEaWQgd2UgYWRkZWQgYSBjb25maWd1
cmF0aW9uIGZpbGUgZm9yIHRoZSByYXMgdW5pdCB0ZXN0cyBvciBzb21ldGhpbmcgbGlrZSB0aGF0
Pw0KPg0KPiBDaHJpc3RpYW4uDQo+DQo+IEFtIDE2LjA4LjE5IHVtIDEzOjA0IHNjaHJpZWIgR3Vj
aHVuIENoZW46DQo+PiBDaGFuZ2UtSWQ6IElhNzZiOTUxNjJmNWY2ZjQxOWY3MGI1M2VmNDQzYmNl
YWYyZTA5MmUwDQo+PiBTaWduZWQtb2ZmLWJ5OiBHdWNodW4gQ2hlbiA8Z3VjaHVuLmNoZW5AYW1k
LmNvbT4NCj4+IC0tLQ0KPj4gICAgZGF0YS9hbWRncHVfcmFzLmpzb24gfCAxMCArKysrKysrKysr
DQo+PiAgICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9kYXRhL2FtZGdwdV9yYXMuanNvbiBiL2RhdGEvYW1kZ3B1X3Jhcy5qc29uIGluZGV4DQo+
PiAyNmZkOTQ2NS4uNDg0ZjEyZjIgMTAwNjQ0DQo+PiAtLS0gYS9kYXRhL2FtZGdwdV9yYXMuanNv
bg0KPj4gKysrIGIvZGF0YS9hbWRncHVfcmFzLmpzb24NCj4+IEBAIC0xMjEsNiArMTIxLDkgQEAN
Cj4+ICAgICAgICAgICAgICAgICAgICAidXRjX2F0Y2wyX2NhY2hlXzRrX2JhbmsiOiAxMTENCj4+
ICAgICAgICAgICAgICAgIH0NCj4+ICAgICAgICAgICAgfSwNCj4+ICsgICAgICAgICJtbWh1YiI6
IHsNCj4+ICsgICAgICAgICAgICAiaW5kZXgiOiAzDQo+PiArICAgICAgICB9LA0KPj4gICAgICAg
IH0sDQo+PiAgICAgICAgInR5cGUiOiB7DQo+PiAgICAgICAgICAgICJwYXJpdHkiOiAxLA0KPj4g
QEAgLTI2Myw1ICsyNjYsMTIgQEANCj4+ICAgICAgICAgICAgICAgICJhZGRyZXNzIjogMCwNCj4+
ICAgICAgICAgICAgICAgICJ2YWx1ZSI6IDANCj4+ICAgICAgICAgICAgfSwNCj4+ICsgICAgICAg
IHsNCj4+ICsgICAgICAgICAgICAibmFtZSI6ICJyYXNfbW1odWIuMS4wIiwNCj4+ICsgICAgICAg
ICAgICAiYmxvY2siOiAibW1odWIiLA0KPj4gKyAgICAgICAgICAgICJ0eXBlIjogInNpbmdsZV9j
b3JyZWN0YWJsZSIsDQo+PiArICAgICAgICAgICAgImFkZHJlc3MiOiAwLA0KPj4gKyAgICAgICAg
ICAgICJ2YWx1ZSI6IDANCj4+ICsgICAgICAgIH0sDQo+PiAgICAgICAgXQ0KPj4gICAgfQ0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
