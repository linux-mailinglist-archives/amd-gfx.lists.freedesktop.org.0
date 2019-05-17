Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76055213E1
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 08:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB99A89854;
	Fri, 17 May 2019 06:51:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810080.outbound.protection.outlook.com [40.107.81.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D5A89854
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 06:51:28 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1545.namprd12.prod.outlook.com (10.172.35.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Fri, 17 May 2019 06:51:27 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 06:51:27 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Tao, Yintian" <Yintian.Tao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] drm/amdgpu: don't read DF register for SRIOV
Thread-Topic: [PATCH] drm/amdgpu: don't read DF register for SRIOV
Thread-Index: AQHVC+BvcbiF9icL4EuTF9l51G4NMaZum0TggABG2AA=
Date: Fri, 17 May 2019 06:51:26 +0000
Message-ID: <2b15a144-a68f-13b9-c111-4185a1100a56@amd.com>
References: <1558008651-21099-1-git-send-email-yttao@amd.com>
 <MN2PR12MB3039577B5F8263EFC7E9BF97E50B0@MN2PR12MB3039.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3039577B5F8263EFC7E9BF97E50B0@MN2PR12MB3039.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR0102CA0063.eurprd01.prod.exchangelabs.com
 (2603:10a6:208::40) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cd21c51-e5a8-4da5-cf14-08d6da941556
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1545; 
x-ms-traffictypediagnostic: DM5PR12MB1545:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB15452CCF8C2B76E2B4896B95830B0@DM5PR12MB1545.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(366004)(376002)(39860400002)(346002)(51874003)(199004)(189003)(13464003)(99286004)(76176011)(71200400001)(8936002)(66476007)(14454004)(64756008)(66556008)(52116002)(64126003)(6116002)(73956011)(66946007)(6436002)(2501003)(486006)(66446008)(65826007)(6486002)(81156014)(81166006)(8676002)(68736007)(7736002)(478600001)(229853002)(4326008)(58126008)(966005)(31686004)(6636002)(36756003)(305945005)(2616005)(6506007)(72206003)(2906002)(71190400001)(86362001)(6246003)(316002)(6512007)(476003)(386003)(53546011)(110136005)(102836004)(446003)(11346002)(65806001)(186003)(14444005)(256004)(53936002)(25786009)(65956001)(46003)(31696002)(6306002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1545;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ssBpInAHZFfLz9E5UAEgxtnlRsQ5GyGWAoHdio61UFKe6Bue/YTfdEZH/2tZA4t3i5XRgL+uaamR93+7Hk3yDm5sLdyILT74IW/XJj3ugSYXg/9ygWDKOA6RYu6WqG6Ka4sIMwJqDbsdvTY25PyRa4T27IchtexXiEbRZxR72J/lFYbOa+cH8DkpwSRgk84JK1F0ioPhK+/KhziZBXrBR+sJlDQ/xMGOYFT29GXi5iqxqYXJ7jGUzD/i3asU/jZvXr0fGtea6q57Afi6L+mRs1sdmTjOpq8GOzu71ACfG/Hm87blhgmcL6/qg0JmXsz+ClvAf2nOrbpKR0oIqit+HJDgzVm4qbZPtuVxDSODqkh1pGl/sR+F+++ZSLmaRW4tDrUPncZMgSEXBLgwtvLQTkJwx/0Vjz+9b4vFbL8T/mA=
Content-ID: <3F7A1609CE344640A014D11F89FCB650@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd21c51-e5a8-4da5-cf14-08d6da941556
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 06:51:26.9991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1545
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbdH6CaBAukkVhVkV3h3BAUJc8beQRcByyY/Faf0Y4A=;
 b=aElZ+etqYjORhMLHwSU10/fE2S4Vn4q8xsVnPMvNpsAyhPJtLACxAtvPAlP6HyIkTCkQ/Vab7pxKzdC40hi3hQkNu/KdnH+PkzTKF7V1D4PH73HzIY5ZzXDn92dxHYPN92jdU+Klql+0Thyw90G0KLzW7QoHvinG6qqibFPz59A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Liu, Monk" <Monk.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgWWludGlhbiwNCg0Kc29ycnkgSSBoYXZlIG5vdCB0aGUgc2xpZ2h0ZXN0IGlkZWEgaG93IHRo
aXMgcGFydCBvZiB0aGUgaHcgd29ya3MuIE1heWJlIA0KdHJ5IHRvIGV4cGxhaW4gbW9yZSB3aGF0
IHRoZSBERiByZWdpc3RlciBpcyBhY3R1YWxseSBkb2luZyBpbiB0aGUgY29tbWl0IA0KbWVzc2Fn
ZS4gSSBzdXNwZWN0IHRoYXQgaXQgaXMgb25seSBhYm91dCBkZXRlY3Rpbmcgd2hpY2ggVlJBTSBj
b25uZWN0aW9uIA0KaXMgdXNlZCwgYnV0IEknbSBub3QgMTAwJSBzdXJlLg0KDQpSZWdhcmRzLA0K
Q2hyaXN0aWFuLg0KDQpBbSAxNy4wNS4xOSB1bSAwNDozOCBzY2hyaWViIFRhbywgWWludGlhbjoN
Cj4gUGluZy4uLg0KPg0KPiBIaSBDaHJpc3RpYW4gYW5kIEFsZXgNCj4NCj4NCj4gQ2FuIHlvdSBo
ZWxwIHJldmlldyB0aGlzPyBUaGFua3MgaW4gYWR2YW5jZS4NCj4NCj4NCj4gQmVzdCBSZWdhcmRz
DQo+IFlpbnRpYW4gVGFvDQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFs
ZiBPZiBZaW50aWFuIFRhbw0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDE2LCAyMDE5IDg6MTEgUE0N
Cj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBMaXUsIE1vbmsgPE1v
bmsuTGl1QGFtZC5jb20+OyBUYW8sIFlpbnRpYW4gPFlpbnRpYW4uVGFvQGFtZC5jb20+DQo+IFN1
YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogZG9uJ3QgcmVhZCBERiByZWdpc3RlciBmb3IgU1JJ
T1YNCj4NCj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KPg0KPiBVbmRlciBTUklPViwgcmVh
ZGluZyBERiByZWdpc3RlciBoYXMgY2hhbmNlIHRvIGxlYWQgdG8gQUVSIGVycm9yIGluIGhvc3Qg
c2lkZSwganVzdCBza2lwIHJlYWRpbmcgaXQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IE1vbmsgTGl1
IDxNb25rLkxpdUBhbWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBZaW50aWFuIFRhbyA8eXR0YW9A
YW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAu
YyB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+IGluZGV4IGE0MTc3
NjMuLmI1YmY5ZWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192OV8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0K
PiBAQCAtODM3LDcgKzgzNyw3IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfbWNfaW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikNCj4NCj4gICAgICAgICAgaWYgKGFtZGdwdV9lbXVfbW9kZSAh
PSAxKQ0KPiAgICAgICAgICAgICAgICAgIGFkZXYtPmdtYy52cmFtX3dpZHRoID0gYW1kZ3B1X2F0
b21maXJtd2FyZV9nZXRfdnJhbV93aWR0aChhZGV2KTsNCj4gLSAgICAgICBpZiAoIWFkZXYtPmdt
Yy52cmFtX3dpZHRoKSB7DQo+ICsgICAgICAgaWYgKCFhZGV2LT5nbWMudnJhbV93aWR0aCAmJiAh
YW1kZ3B1X3NyaW92X3ZmKGFkZXYpKSB7DQo+ICAgICAgICAgICAgICAgICAgLyogaGJtIG1lbW9y
eSBjaGFubmVsIHNpemUgKi8NCj4gICAgICAgICAgICAgICAgICBpZiAoYWRldi0+ZmxhZ3MgJiBB
TURfSVNfQVBVKQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgY2hhbnNpemUgPSA2NDsNCj4g
LS0NCj4gMi43LjQNCj4NCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
