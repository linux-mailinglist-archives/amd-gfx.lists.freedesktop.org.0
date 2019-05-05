Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA1513D49
	for <lists+amd-gfx@lfdr.de>; Sun,  5 May 2019 06:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279C089332;
	Sun,  5 May 2019 04:33:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800072.outbound.protection.outlook.com [40.107.80.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9E789332
 for <amd-gfx@lists.freedesktop.org>; Sun,  5 May 2019 04:33:10 +0000 (UTC)
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3824.namprd12.prod.outlook.com (10.255.237.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.14; Sun, 5 May 2019 04:33:07 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::a0c2:421a:7911:c0fd]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::a0c2:421a:7911:c0fd%3]) with mapi id 15.20.1856.012; Sun, 5 May 2019
 04:33:06 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: check for invalid profile_exit setting
Thread-Topic: [PATCH] drm/amd/powerplay: check for invalid profile_exit setting
Thread-Index: AQHVAvFoiTPQ3fNXR0efxV0jRuMDvqZb4c+A
Date: Sun, 5 May 2019 04:33:06 +0000
Message-ID: <MN2PR12MB3054A7E8FC844BD2621D2FE8B0370@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190505031945.5355-1-evan.quan@amd.com>
In-Reply-To: <20190505031945.5355-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f2a4cd2-a835-4d4c-023a-08d6d112c560
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3824; 
x-ms-traffictypediagnostic: MN2PR12MB3824:
x-microsoft-antispam-prvs: <MN2PR12MB382424BEA9478A94F97F937BB0370@MN2PR12MB3824.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 00286C0CA6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(346002)(376002)(39860400002)(136003)(189003)(199004)(13464003)(76116006)(73956011)(7736002)(14444005)(305945005)(2906002)(316002)(66066001)(229853002)(256004)(66946007)(72206003)(6436002)(102836004)(14454004)(110136005)(74316002)(3846002)(6116002)(8676002)(64756008)(66556008)(66476007)(66446008)(486006)(478600001)(9686003)(99286004)(81156014)(6246003)(81166006)(86362001)(76176011)(11346002)(186003)(71190400001)(4326008)(71200400001)(55016002)(33656002)(25786009)(476003)(2501003)(5660300002)(53936002)(446003)(52536014)(26005)(7696005)(8936002)(6506007)(53546011)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3824;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HTqRN5tUw4hm+w/QgTUYTOiQdAbL0PqO1BPjQY9HCrU25OsjQflUw3Di4SZgd7AhtXZ3j8p+dSFm6p276OZ6SZ63rJ89UYnZEnXZaHhIZen3HTHb1WWa3OIwNOmbk/eVkojeT9ftLDj2TisGUdJhkn4N3j6VtVZDkE9+J6v5DSP6ed6iRU5OGha9EThZypKZg2j8Gx1aTvX+bvu6vxDritWxS53KrPrBOk/YoxCBq/8uPObPxVAmVPDu+FhMlUTxc0cjzFNLyW2FvEN4Yg7c3EIQM2C+rHRPkAbbRuHCwlBGAYKlPSLkmtkLQ77AevaNnjkj2IGR3CmuOQd1qcnpz+iw0l19c5EoLPoI+Gw27wX9DVclsdwCe6W/nHEb0HZhHMSdN59rynHogCbZOldLn88OSIF7nQloHbCEtfYKbK0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2a4cd2-a835-4d4c-023a-08d6d112c560
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2019 04:33:06.6951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3824
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRCnKSZ+yd5IkjynsqbLydtpoAa1439KysY3+lkfuGY=;
 b=zF8t1NwCKNc9ko6IMfYvibrZ/DI+6kz2M/zWyJwDmv+nSoBhas9VgIMLG2cGiiYNZt/sOzyM+Ko5H63/4xkW+w5vjGRlTJZf5IjL8m9kV6tH8x8Pt7q5utZ5V/9rQ6jCLRfj5r02IRersEPV6eXP0ogEZaBuYYQLbVanGYS5p5o=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4NCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPg0K
PiBTZW50OiAyMDE55bm0NeaciDXml6UgMTE6MjANCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IENjOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IFF1YW4sIEV2
YW4gPEV2YW4uUXVhbkBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWQvcG93ZXJw
bGF5OiBjaGVjayBmb3IgaW52YWxpZCBwcm9maWxlX2V4aXQgc2V0dGluZw0KPiANCj4gcHJvZmls
ZV9leGl0IHBlcmZvcm1hbmNlIGxldmVsIHNldHRpbmcgaXMgdmFsaWQgb25seSB3aGVuIGN1cnJl
bnQgbW9kZSBpcyBpbg0KPiBwcm9maWxlIG1vZGUuDQo+IA0KPiBDaGFuZ2UtSWQ6IEk2OTQwMTAy
ZDM4ZGJiN2E0YjAyMzNmY2U1Mjc3ZTE3MDQ2NzJkOGY0DQo+IFNpZ25lZC1vZmYtYnk6IEV2YW4g
UXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3BtLmMgfCAxMCArKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9wbS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bt
LmMNCj4gaW5kZXggYjgwODczMzQ4NjI0Li5kZjc4MzcyMjk2YmYgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jDQo+IEBAIC00MDQsNiArNDA0LDE2IEBAIHN0YXRp
YyBzc2l6ZV90DQo+IGFtZGdwdV9zZXRfZHBtX2ZvcmNlZF9wZXJmb3JtYW5jZV9sZXZlbChzdHJ1
Y3QgZGV2aWNlICpkZXYsDQo+ICAJaWYgKGN1cnJlbnRfbGV2ZWwgPT0gbGV2ZWwpDQo+ICAJCXJl
dHVybiBjb3VudDsNCj4gDQo+ICsJLyogcHJvZmlsZV9leGl0IHNldHRpbmcgaXMgdmFsaWQgb25s
eSB3aGVuIGN1cnJlbnQgbW9kZSBpcyBpbiBwcm9maWxlDQo+IG1vZGUgKi8NCj4gKwlpZiAoIShj
dXJyZW50X2xldmVsICYNCj4gKEFNRF9EUE1fRk9SQ0VEX0xFVkVMX1BST0ZJTEVfU1RBTkRBUkQg
fA0KPiArCSAgICBBTURfRFBNX0ZPUkNFRF9MRVZFTF9QUk9GSUxFX01JTl9TQ0xLIHwNCj4gKwkg
ICAgQU1EX0RQTV9GT1JDRURfTEVWRUxfUFJPRklMRV9NSU5fTUNMSyB8DQo+ICsJICAgIEFNRF9E
UE1fRk9SQ0VEX0xFVkVMX1BST0ZJTEVfUEVBSykpICYmDQo+ICsJICAgIChsZXZlbCA9PSBBTURf
RFBNX0ZPUkNFRF9MRVZFTF9QUk9GSUxFX0VYSVQpKSB7DQo+ICsJCXByX2VycigiQ3VycmVudGx5
IG5vdCBpbiBhbnkgcHJvZmlsZSBtb2RlIVxuIik7DQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiAr
CX0NCj4gKw0KPiAgCWlmIChpc19zdXBwb3J0X3N3X3NtdShhZGV2KSkgew0KPiAgCQltdXRleF9s
b2NrKCZhZGV2LT5wbS5tdXRleCk7DQo+ICAJCWlmIChhZGV2LT5wbS5kcG0udGhlcm1hbF9hY3Rp
dmUpIHsNCj4gLS0NCj4gMi4yMS4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
