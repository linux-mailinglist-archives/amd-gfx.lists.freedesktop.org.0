Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D92CC12B2A
	for <lists+amd-gfx@lfdr.de>; Fri,  3 May 2019 12:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD8089B06;
	Fri,  3 May 2019 10:03:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D5789B06
 for <amd-gfx@lists.freedesktop.org>; Fri,  3 May 2019 10:03:24 +0000 (UTC)
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3214.namprd12.prod.outlook.com (20.179.83.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Fri, 3 May 2019 10:03:23 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::c93d:cf5d:3f72:aff6]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::c93d:cf5d:3f72:aff6%2]) with mapi id 15.20.1856.012; Fri, 3 May 2019
 10:03:23 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "StDenis, Tom" <Tom.StDenis@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/amdgpu: Add MEM_LOAD to amdgpu_pm_info debugfs
 file
Thread-Topic: [PATCH] drm/amd/amdgpu: Add MEM_LOAD to amdgpu_pm_info debugfs
 file
Thread-Index: AQHVAPKFFI/V0ZP6BEeAQBURfoIth6ZZK6ng
Date: Fri, 3 May 2019 10:03:23 +0000
Message-ID: <MN2PR12MB3344320DE7F901C52FAD3079E4350@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190502142239.22322-1-tom.stdenis@amd.com>
In-Reply-To: <20190502142239.22322-1-tom.stdenis@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [210.13.97.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fbdfa7b2-5023-4270-c617-08d6cfae93f9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3214; 
x-ms-traffictypediagnostic: MN2PR12MB3214:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3214FC9A40CFBC500F43EC56E4350@MN2PR12MB3214.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:128;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(376002)(39860400002)(136003)(396003)(189003)(199004)(13464003)(478600001)(66946007)(25786009)(229853002)(68736007)(7736002)(6436002)(5660300002)(6116002)(55016002)(72206003)(2906002)(66476007)(74316002)(86362001)(64756008)(66446008)(3846002)(66556008)(305945005)(52536014)(966005)(4326008)(256004)(8676002)(476003)(53936002)(76176011)(486006)(9686003)(110136005)(6306002)(6506007)(81156014)(316002)(26005)(8936002)(446003)(33656002)(11346002)(76116006)(66066001)(99286004)(73956011)(6246003)(53546011)(102836004)(81166006)(2501003)(186003)(14454004)(71200400001)(71190400001)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3214;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tz8dG9KrF10YH9Lrc9IMDFAxk/zEBFMweyzRDStUK4xeevbSO3a/4y6Ih4XKMituCuAeyPYZbbhVGROZPgNH6uA//P7r2wdU6BaEMRDFD6kfseRd8GXyrw6pkyBituSQqmXBGyNRTuwNjOjzINLDXhERAwhPQknZHdTBn0e08YK8o8DjVVQpgbwTg/D0K8v8nmzjFDw7XJZOC0xvYttlWArunv/x+OPRI1FEKWXMCZDrUm1viyhr2bgfATYoDtEFny+Kyvgj2R0XEi7sEze5NnuV3/OKIcBnhQopmJjfWxQnRVTfWSy1b2QnCe5Me7bsXKz6Ss/RS265WLIEWequF/6pIBv3uBeV0ZE9Ltql2mdw366ntaaM7Y2enBeF2e37UZdNnJL/sBqIHxUMXRnVHUC+WOh46tk9oENgJy3jbFo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbdfa7b2-5023-4270-c617-08d6cfae93f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 10:03:23.1841 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3214
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjC0XboOMbcZifMGlcgss94YktIZ6PLCtYij4dKvoYA=;
 b=boouspCu/qMGDj6aIak9O6ZZrE1weK+jbsMxGiIC+K0a/CWx+doemriUySPmNpMLxPeIzkCyA9b/xjbP5TNbe9SY9bivVFIWLB5kehHHu1xEmW5i79GSri7OS3jX5bXF91ikRjT8yrvJ/UuyJ+PPKcNA8UIr4klHuBJA6CO7Xa8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "StDenis, Tom" <Tom.StDenis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IFN0RGVuaXMsIFRvbQ0KPiBTZW50OiAy
MDE55bm0NeaciDLml6UgMjI6MjMNCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+IENjOiBTdERlbmlzLCBUb20gPFRvbS5TdERlbmlzQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQ
QVRDSF0gZHJtL2FtZC9hbWRncHU6IEFkZCBNRU1fTE9BRCB0byBhbWRncHVfcG1faW5mbw0KPiBk
ZWJ1Z2ZzIGZpbGUNCj4gDQo+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFRvbSBTdCBEZW5pcyA8dG9tLnN0ZGVuaXNAYW1kLmNvbT4NCj4gLS0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyB8IDQgKysrKw0KPiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3BtLmMNCj4gaW5kZXggNWUyZDAzOWUwOWFkLi5lMDc4OWYwZjI2NzAgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jDQo+IEBAIC0yOTU1LDYgKzI5
NTUsMTAgQEAgc3RhdGljIGludCBhbWRncHVfZGVidWdmc19wbV9pbmZvX3BwKHN0cnVjdA0KPiBz
ZXFfZmlsZSAqbSwgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmENCj4gICAgICAgICAvKiBHUFUgTG9h
ZCAqLw0KPiAgICAgICAgIGlmICghYW1kZ3B1X2RwbV9yZWFkX3NlbnNvcihhZGV2LA0KPiBBTURH
UFVfUFBfU0VOU09SX0dQVV9MT0FELCAodm9pZCAqKSZ2YWx1ZSwgJnNpemUpKQ0KPiAgICAgICAg
ICAgICAgICAgc2VxX3ByaW50ZihtLCAiR1BVIExvYWQ6ICV1ICUlXG4iLCB2YWx1ZSk7DQo+ICsg
ICAgICAgLyogTUVNIExvYWQgKi8NCj4gKyAgICAgICBpZiAoIWFtZGdwdV9kcG1fcmVhZF9zZW5z
b3IoYWRldiwNCj4gQU1ER1BVX1BQX1NFTlNPUl9NRU1fTE9BRCwgKHZvaWQgKikmdmFsdWUsICZz
aXplKSkNCj4gKyAgICAgICAgICAgICAgIHNlcV9wcmludGYobSwgIk1FTSBMb2FkOiAldSAlJVxu
IiwgdmFsdWUpOw0KPiArDQo+ICAgICAgICAgc2VxX3ByaW50ZihtLCAiXG4iKTsNCj4gDQo+ICAg
ICAgICAgLyogU01DIGZlYXR1cmUgbWFzayAqLw0KPiAtLQ0KPiAyLjIwLjENCj4gDQo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFp
bGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
