Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAFF33EFF
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 08:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7736F895B4;
	Tue,  4 Jun 2019 06:31:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790053.outbound.protection.outlook.com [40.107.79.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FEA895B4
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 06:31:13 +0000 (UTC)
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB3006.namprd12.prod.outlook.com (20.178.243.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 06:31:10 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::d58b:3f32:f2ff:9565]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::d58b:3f32:f2ff:9565%6]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 06:31:10 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Huang, Trigger" <Trigger.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Hardcode reg access using L1 security
Thread-Topic: [PATCH] drm/amdgpu: Hardcode reg access using L1 security
Thread-Index: AQHVGgGJHNuFkCoIUkycECOFcIhG76aLChng
Date: Tue, 4 Jun 2019 06:31:10 +0000
Message-ID: <MN2PR12MB2975B9077C0F0CAFB877FCB58F150@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <1559562183-29241-1-git-send-email-Trigger.Huang@amd.com>
In-Reply-To: <1559562183-29241-1-git-send-email-Trigger.Huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 355caebe-180d-414b-138f-08d6e8b63c0f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3006; 
x-ms-traffictypediagnostic: MN2PR12MB3006:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB300627D7C95EB7166C809F7E8F150@MN2PR12MB3006.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(346002)(366004)(396003)(39860400002)(13464003)(189003)(199004)(478600001)(229853002)(316002)(7736002)(76176011)(8936002)(15650500001)(8676002)(71190400001)(6506007)(25786009)(2906002)(55016002)(81156014)(11346002)(256004)(305945005)(102836004)(6436002)(86362001)(74316002)(476003)(71200400001)(14444005)(446003)(81166006)(486006)(68736007)(66946007)(66476007)(33656002)(6306002)(2501003)(14454004)(6246003)(5660300002)(9686003)(52536014)(53936002)(66556008)(66066001)(72206003)(110136005)(26005)(99286004)(186003)(73956011)(3846002)(6116002)(7696005)(66446008)(76116006)(64756008)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3006;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GAO2nxr9wfhZyFKvEpLG6QyClVl7SwMk62lq4NARdWzD4jnLdawY7D20CsmkZTO1x7xH3EM6Vsuj/CPFAa9M5BosVfegGGiUjIaQrPiCYmQkDwAK6Qs9sxsODqEJfznOkEwG/q3NW90aC7XjN2sXx2CgjbXmDcrY/pu6+3FXYpGd3ifbTiFrdjXlYsF+GGG0+U90R9ePm+jOM0d6T9WXqsoRO6EVoZRadNOmp+uh4dQtz//6yuNUud46guACUl2yxqN6BzDzI+hHcke9OpmROSjQWrsEr+pjG6sKdmtyxChsR5IfpPttD1IOMdtSxb8J+5e6MJ452F98CXwgXhotCYUINWiIJD4TXVAo/HNwYLo81Ojfv8vKCwkkcv/r3ILv5VGKleTkYmgT+fEt3AohTossDjr4Cww2mck7whY6Cqo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 355caebe-180d-414b-138f-08d6e8b63c0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 06:31:10.7067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqdeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3006
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqBCiTV9mkwFYQdxoEx+n0QzsesMJaJ/VCBzg2nisOg=;
 b=cWEQUeBurn1OzLqWnbQRVBDsDT11m085zlb85LtGF9TdP+LoSceDZgXJQ97nlL0sqh9vIPx6+LEfsH9tuPrLFOodzg/j5SNyWp5QmNSXB/Je0StiNC4P5OMDwtSkSO0FuatD/kdWGvwCwsXL3Zdreq54SoAMdV2w1AkkSF0tdl4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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
Cc: "Huang, Trigger" <Trigger.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCg0KPi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+VHJpZ2dlciBIdWFuZw0KPlNlbnQ6IE1v
bmRheSwgSnVuZSAzLCAyMDE5IDc6NDMgUE0NCj5UbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj5DYzogSHVhbmcsIFRyaWdnZXIgPFRyaWdnZXIuSHVhbmdAYW1kLmNvbT4NCj5TdWJq
ZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IEhhcmRjb2RlIHJlZyBhY2Nlc3MgdXNpbmcgTDEgc2Vj
dXJpdHkNCj4NCj5VbmRlciBWZWdhMTAgU1ItSU9WIFZGLCBMMSByZWdpc3RlciBhY2Nlc3MgbW9k
ZSBzaG91bGQgYmUgZW5hYmxlZCBieQ0KPmRlZmF1bHQgYXMgdGhlIG5vbi1zZWN1cml0eSBWRiB3
aWxsIG5vIGxvbmdlciBiZSBzdXBwb3J0ZWQuDQo+DQo+U2lnbmVkLW9mZi1ieTogVHJpZ2dlciBI
dWFuZyA8VHJpZ2dlci5IdWFuZ0BhbWQuY29tPg0KPi0tLQ0KPiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9teGdwdV9haS5jIHwgMTUgKysrKysrLS0tLS0tLS0tDQo+IDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+DQo+ZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L214Z3B1X2FpLmMNCj5iL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L214Z3B1X2FpLmMNCj5pbmRleCAzMTAzMGY4Li4yMzU1NDhjIDEwMDY0NA0KPi0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L214Z3B1X2FpLmMNCj4rKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9teGdwdV9haS5jDQo+QEAgLTQ1MSwxOSArNDUxLDE2IEBAIHZvaWQg
eGdwdV9haV9tYWlsYm94X3B1dF9pcnEoc3RydWN0DQo+YW1kZ3B1X2RldmljZSAqYWRldikNCj4N
Cj4gc3RhdGljIHZvaWQgeGdwdV9haV9pbml0X3JlZ19hY2Nlc3NfbW9kZShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikgIHsNCj4tCXVpbnQzMl90IHJsY19md192ZXIgPSBSUkVHMzJfU09DMTUo
R0MsIDAsDQo+bW1STENfR1BNX0dFTkVSQUxfNik7DQo+LQl1aW50MzJfdCBzb3NfZndfdmVyID0g
UlJFRzMyX1NPQzE1KE1QMCwgMCwNCj5tbU1QMF9TTU5fQzJQTVNHXzU4KTsNCj4tDQo+IAlhZGV2
LT52aXJ0LnJlZ19hY2Nlc3NfbW9kZSA9DQo+QU1ER1BVX1ZJUlRfUkVHX0FDQ0VTU19MRUdBQ1k7
DQo+DQo+LQlpZiAocmxjX2Z3X3ZlciA+PSAweDVkKQ0KPi0JCWFkZXYtPnZpcnQucmVnX2FjY2Vz
c19tb2RlIHw9DQo+QU1ER1BVX1ZJUlRfUkVHX0FDQ0VTU19STEM7DQo+KwkvKiBFbmFibGUgTDEg
c2VjdXJpdHkgcmVnIGFjY2VzcyBtb2RlIGJ5IGRlZmF1bCwgIGFzIG5vbi1zZWN1cml0eSBWRg0K
PisJICogd2lsbCBubyBsb25nZXIgYmUgc3VwcG9ydGVkLg0KPisJICovDQo+KwlhZGV2LT52aXJ0
LnJlZ19hY2Nlc3NfbW9kZSB8PSBBTURHUFVfVklSVF9SRUdfQUNDRVNTX1JMQzsNCj4NCj4tCWlm
IChzb3NfZndfdmVyID49IDB4ODA0NTUpDQo+LQkJYWRldi0+dmlydC5yZWdfYWNjZXNzX21vZGUg
fD0NCj5BTURHUFVfVklSVF9SRUdfQUNDRVNTX1BTUF9QUkdfSUg7DQo+KwlhZGV2LT52aXJ0LnJl
Z19hY2Nlc3NfbW9kZSB8PQ0KPkFNREdQVV9WSVJUX1JFR19BQ0NFU1NfUFNQX1BSR19JSDsNCj4N
Cj4tCWlmIChzb3NfZndfdmVyID49IDB4ODA0NWIpDQo+LQkJYWRldi0+dmlydC5yZWdfYWNjZXNz
X21vZGUgfD0NCj5BTURHUFVfVklSVF9SRUdfU0tJUF9TRUVUSU5HOw0KPisJYWRldi0+dmlydC5y
ZWdfYWNjZXNzX21vZGUgfD0gQU1ER1BVX1ZJUlRfUkVHX1NLSVBfU0VFVElORzsNCj4gfQ0KPg0K
PiBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3ZpcnRfb3BzIHhncHVfYWlfdmlydF9vcHMgPSB7DQo+LS0N
Cj4yLjcuNA0KPg0KPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQo+YW1kLWdmeCBtYWlsaW5nIGxpc3QNCj5hbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
