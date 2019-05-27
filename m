Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 657E52BA0D
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 20:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A5F899F3;
	Mon, 27 May 2019 18:23:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700075.outbound.protection.outlook.com [40.107.70.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6345A899F3
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 18:23:26 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3673.namprd12.prod.outlook.com (10.255.76.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Mon, 27 May 2019 18:23:24 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1922.021; Mon, 27 May 2019
 18:23:24 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: enable PCIE atomics ops support
Thread-Topic: [PATCH] drm/amdgpu: enable PCIE atomics ops support
Thread-Index: AQHVFHWiV+KPu3QpmUS98wAwuoZ18qZ+yNFAgAATKwCAAG2gAA==
Date: Mon, 27 May 2019 18:23:24 +0000
Message-ID: <f6b13954-1876-6b5a-bebf-4febeb51f155@amd.com>
References: <1558952326-5611-1-git-send-email-Jack.Xiao@amd.com>
 <BYAPR12MB26323A2A4408EB2EBB1A1448FC1D0@BYAPR12MB2632.namprd12.prod.outlook.com>
 <dc7f3fa5-2b67-0b05-e3f0-46f3733a430a@gmail.com>
In-Reply-To: <dc7f3fa5-2b67-0b05-e3f0-46f3733a430a@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTXPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::48) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc8ed411-55f0-4256-7463-08d6e2d067c5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3673; 
x-ms-traffictypediagnostic: DM6PR12MB3673:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB36731D2D2F2662BA996408C4921D0@DM6PR12MB3673.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0050CEFE70
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(396003)(366004)(136003)(199004)(189003)(13464003)(11346002)(486006)(446003)(6246003)(476003)(2616005)(64126003)(36756003)(2501003)(25786009)(31686004)(2906002)(68736007)(110136005)(66946007)(66446008)(305945005)(7736002)(5660300002)(73956011)(64756008)(66556008)(66476007)(58126008)(3846002)(6116002)(86362001)(316002)(31696002)(66574012)(386003)(81166006)(81156014)(6506007)(53546011)(52116002)(72206003)(26005)(65956001)(66066001)(8676002)(8936002)(478600001)(99286004)(14454004)(6436002)(229853002)(256004)(14444005)(6512007)(6486002)(6306002)(102836004)(71190400001)(71200400001)(966005)(76176011)(53936002)(65826007)(65806001)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3673;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zJwp2qmujcVZM5MrqXTpDiZ5TMM7TsDavHWsbY7FydY8YDLC1l7n/GUL7LNqc2VFFxGIZ/WHlUWNnMGkCgc5FyzQzy9bqGkk7MGIw9Ev4RryR2FayaYAIHXZq4b3iovIM8HrOCGEU2zBoZ9BIs9PvK8dXT2PfnHcXi7T4PMq+QW5v+1sMQYqCN9Ak5YNsIuE+mmx2YNdXubRswbyzGmJFa/TViMu6tnh0EYOgyWjX7X9tvH5Fdks+Qq6SJVsXKe4cTC22KPm/DqaVgLNq3EKcxnRk+C7/fX+lV2+SEMuSCvWBuSiPOUOnR5on0ss+BaQzVvZw8wjvmHOR79OKKrlZ38VG1LD2JfejJjRyGHHUV2eaF51cPvaCJLRqWyYU68CbmQsYN4xLrIXI6LBHRtpn2Pj/hwfSyCIbctvJoZEUFc=
Content-ID: <003C2830B85D4E44BAB0814348B1C125@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8ed411-55f0-4256-7463-08d6e2d067c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2019 18:23:24.3481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3673
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJyvI6ewfmJGuCDZ6OkM8TUHfWi8+9m4+cCKAWq07SU=;
 b=QooP5ebBoHINPqnDjc1Rifgz7xMYsKDBVm6eGrPMccyssFf9k+myEuqbEqYd+tBvWO4aRMnBTTRgaT5mEPLEA7ENlC5t7lg/Eee+RnOqNdcOLSKBnjRg2XeE6XWcT7YUaGd7GgRiAh5GJfKnpWaWuD9f1UjNTur+5c7iaNV5cEg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0yNyA3OjUxIGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+IFRoYXQg
aWRlYSBzb3VuZHMgc2FuZSB0byBtZSBhcyB3ZWxsLg0KPg0KPiBCeSB0aGUgd2F5LCBkbyB3ZSBz
b21ld2hlcmUgc2lnbmFsIHRvIHVzZXJzcGFjZSBpZiBhdG9taWNzIGFyZSANCj4gc3VwcG9ydGVk
IG9yIG5vdD8NClllcy4gS0ZEIHRvcG9sb2d5IChhIGZsYWcgaW4gdGhlIGlvbGluaykgcHJvdmlk
ZXMgdGhhdCBpbmZvcm1hdGlvbiB0byANCnVzZXIgbW9kZS4NCg0KUmVnYXJkcywNCiDCoCBGZWxp
eA0KDQoNCj4NCj4gSSBtZWFuIHdvdWxkIGJlIG5pY2UgdG8ga2VlcCB0aGUgc3RhdGUgaW5zaWRl
IGFkZXYgaWYgdGhpcyBmYWlscyBmb3IgDQo+IHNvbWUgcmVhc29uLg0KPg0KPiBDaHJpc3RpYW4u
DQo+DQo+IEFtIDI3LjA1LjE5IHVtIDEzOjE2IHNjaHJpZWIgWmhhbmcsIEhhd2tpbmc6DQo+PiBI
b3cgYWJvdXQgcHV0IHBjaV9lbmFibGVfYXRvbWljX29wc190b19yb290IGFoZWFkIG9mIA0KPj4g
YW1kZ3B1X2RldmljZV9pcF9lYXJseV9pbml0LCB3aGlsZSBtb3ZlIHBjaV9hdG9taWNfcmVxdWVz
dGVkIGZyb20ga2ZkIA0KPj4gZGV2aWNlIHRvIGtnZCBkZXZpY2UgPyBJbiBzdWNoIHdheSwgd2Ug
Y2FuIGF2b2lkIGR1cGxpY2F0ZSBhdG9taWMgDQo+PiByZXF1ZXN0IGZyb20gYm90aCBhbWRncHUg
YW5kIGFtZGtmZC4NCj4+DQo+PiBSZWdhcmRzLA0KPj4gSGF3a2luZw0KPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5m
cmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiANCj4+IFhpYW8sIEphY2sNCj4+IFNlbnQ6IDIw
MTnlubQ15pyIMjfml6UgMTg6MTkNCj4+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPj4gQ2M6IFhpYW8sIEphY2sgPEphY2suWGlhb0BhbWQuY29tPg0KPj4gU3ViamVjdDogW1BB
VENIXSBkcm0vYW1kZ3B1OiBlbmFibGUgUENJRSBhdG9taWNzIG9wcyBzdXBwb3J0DQo+Pg0KPj4g
R1BVIGF0b21pY3Mgb3BlcmF0aW9uIGRlcGVuZHMgb24gUENJRSBhdG9taWNzIHN1cHBvcnQuDQo+
PiBBbHdheXMgZW5hYmxlIFBDSUUgYXRvbWljcyBvcHMgc3VwcG9ydCBpbiBjYXNlIHRoYXQgaXQg
aGFzbid0IGJlZW4gDQo+PiBlbmFibGVkLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEphY2sgWGlh
byA8SmFjay5YaWFvQGFtZC5jb20+DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDcgKysrKysrKw0KPj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZXZpY2UuYw0KPj4gaW5kZXggYmRkMWZlNzMuLmEyYzYwNjQgMTAwNjQ0DQo+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPj4gQEAgLTI1NjIs
NiArMjU2MiwxMyBAQCBpbnQgYW1kZ3B1X2RldmljZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNl
IA0KPj4gKmFkZXYsDQo+PiDCoMKgwqDCoMKgIGlmIChhZGV2LT5yaW9fbWVtID09IE5VTEwpDQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX0lORk8oIlBDSSBJL08gQkFSIGlzIG5vdCBmb3VuZC5c
biIpOw0KPj4gwqAgK8KgwqDCoCAvKiBlbmFibGUgUENJRSBhdG9taWMgb3BzICovDQo+PiArwqDC
oMKgIHIgPSBwY2lfZW5hYmxlX2F0b21pY19vcHNfdG9fcm9vdChhZGV2LT5wZGV2LA0KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBQQ0lfRVhQX0RFVkNBUDJfQVRPTUlDX0NPTVAz
MiB8DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBDSV9FWFBfREVWQ0FQMl9B
VE9NSUNfQ09NUDY0KTsNCj4+ICvCoMKgwqAgaWYgKHIpDQo+PiArwqDCoMKgwqDCoMKgwqAgRFJN
X0lORk8oIlBDSUUgYXRvbWljIG9wcyBpcyBub3Qgc3VwcG9ydGVkXG4iKTsNCj4+ICsNCj4+IMKg
wqDCoMKgwqAgYW1kZ3B1X2RldmljZV9nZXRfcGNpZV9pbmZvKGFkZXYpOw0KPj4gwqAgwqDCoMKg
wqDCoCAvKiBlYXJseSBpbml0IGZ1bmN0aW9ucyAqLw0KPj4gLS0gDQo+PiAxLjkuMQ0KPj4NCj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+PiBhbWQt
Z2Z4IG1haWxpbmcgbGlzdA0KPj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KPj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IGFtZC1n
ZnggbWFpbGluZyBsaXN0DQo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQo+DQo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1n
ZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
