Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F5D357BC
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jun 2019 09:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0258289598;
	Wed,  5 Jun 2019 07:29:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680040.outbound.protection.outlook.com [40.107.68.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B247F8951B
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 07:29:06 +0000 (UTC)
Received: from MN2PR12MB3933.namprd12.prod.outlook.com (10.255.238.94) by
 MN2PR12MB3485.namprd12.prod.outlook.com (20.178.242.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 07:29:04 +0000
Received: from MN2PR12MB3933.namprd12.prod.outlook.com
 ([fe80::1c86:c8e7:b7e:ae61]) by MN2PR12MB3933.namprd12.prod.outlook.com
 ([fe80::1c86:c8e7:b7e:ae61%6]) with mapi id 15.20.1965.011; Wed, 5 Jun 2019
 07:29:04 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Subject: FW: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu) reload issue
Thread-Topic: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu) reload issue
Thread-Index: AQHVG2oudZY69HM9mkCE8kosxqR2paaMqc8A
Date: Wed, 5 Jun 2019 07:29:04 +0000
Message-ID: <MN2PR12MB393308FE408E9E41EF0D615184160@MN2PR12MB3933.namprd12.prod.outlook.com>
References: <1559717076-25471-1-git-send-email-Monk.Liu@amd.com>
In-Reply-To: <1559717076-25471-1-git-send-email-Monk.Liu@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d85269f-40ec-4ec1-0358-08d6e9877d27
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3485; 
x-ms-traffictypediagnostic: MN2PR12MB3485:
x-microsoft-antispam-prvs: <MN2PR12MB3485A7AD42BFFBC4F1D7ED5184160@MN2PR12MB3485.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(39860400002)(376002)(396003)(346002)(13464003)(199004)(189003)(3846002)(7696005)(102836004)(110136005)(99286004)(25786009)(6116002)(476003)(86362001)(446003)(11346002)(2501003)(26005)(186003)(72206003)(486006)(76176011)(478600001)(66476007)(71190400001)(73956011)(66556008)(71200400001)(14454004)(2906002)(76116006)(52536014)(66946007)(66446008)(14444005)(256004)(5660300002)(64756008)(81166006)(6436002)(2473003)(6506007)(8936002)(74316002)(9686003)(33656002)(53546011)(6636002)(66066001)(316002)(68736007)(229853002)(305945005)(7736002)(53936002)(8676002)(81156014)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3485;
 H:MN2PR12MB3933.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OUDQJiyHh7koqdCpJcFRbupO+zJrR+CPFhUJyjrQPqJTVyEYNFLRxI9TCiGpkomGuDDQ/+0FnAAewTGjBT4rSc+kwbvplS2UYM98Pd8YQ5bRtejwsctOAB0eQAtaHR0Lqyd/eX59qqmqyv5fi95YilupXr5K5W7MAMJjFwFTpVTwztOqRKW2enQX4ueJFPylYJbh1nyT/JYXFIDUOyag9g0xSYoeO94facdqQ9vtOibBaqmnO87r1Ekt8zLN14kykhLqECrn5hzqA13NBTMXt8GRoTTX3GVW3CkK4rbDE9T1QfjtYKiNH1gCbeMgXvDnTZL10F5gHlIUuq8Sb9O0WAar6h4PO30rzMI8RacVs+xQXvskXaqpB4FutD7LFxk7kt/Oys/1+P2vmI9p6rRWbFmQVk13Cppwge8MOQBfR8c=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d85269f-40ec-4ec1-0358-08d6e9877d27
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 07:29:04.7340 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jyliu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3485
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfr9s0c8NDlbCCTQvsM9BuxxA9bN37UtRofEb66hsAg=;
 b=cKU/ugHMmMD67ed7QZ1KJkrXzpMfS/cohfPXFv9Ged/sAvDzaskMzMMmnkz2LjGhcm0/m3qIJGNjIDfwo0jh/ctyKrUOx+mDoiQ4lvHvo7EYdICIkDtgxE/mPfwHrNVeFHXXeS340cvHKFN8DaVGnTw2ZUezpspz9gT46/lmsoU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Monk.Liu@amd.com; 
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

CgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiBNb25rIExpdSA8TW9uay5MaXVAYW1k
LmNvbT4gClNlbnQ6IFdlZG5lc2RheSwgSnVuZSA1LCAyMDE5IDI6NDUgUE0KVG86IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+ClN1
YmplY3Q6IFtQQVRDSF0gZHJtL3R0bTogZml4IHR0bSBjbGllbnQgZHJpdmVyIChlLmcuIGFtZGdw
dSkgcmVsb2FkIGlzc3VlCgpuZWVkIHRvIGNsZWFyIGJvIGdsb2IgYW5kIG1lbSBnbG9iIGR1cmlu
ZyB0aGVpciByZWxlYXNlIG90aGVyd2lzZSB0aGVpciBtZW1iZXIgdmFsdWUgd291bGQgYmUgd3Jv
bmdseSB1c2VkIGluIHRoZSBuZXh0IGdsb2IgaW5pdCBzdGFnZSBhbmQgbGVhZCB0byB3aWxkIHBv
aW50ZXIgYWNjZXNzIHByb2JsZW1zOgoKMSkga29iai5zdGF0ZV9pbml0aWFsaXplZCBpcyAxCjIp
IHR0bV9ib19nbG9iLmJvX2NvdW50IGlzbid0IGNsZWFyZWQgYW5kIHJlZmVyZW5jZWQgdmlhIGl0
CiAgIG9uIG1lbWJlciAic3dhcF9scnUiIHdvdWxkIGhpdCBvdXQgb2YgYm91bmQgYXJyYXkgYWNj
ZXNzaW5nCiAgIGJ1ZwoKU2lnbmVkLW9mZi1ieTogTW9uayBMaXUgPE1vbmsuTGl1QGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAgICAgfCAyICsrCiBkcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9tZW1vcnkuYyB8IDggKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGluZGV4IGM3ZGU2NjcuLjY0MzRlYWMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYwpAQCAtMTYwNCw2ICsxNjA0LDggQEAgc3RhdGljIHZvaWQgdHRtX2Jv
X2dsb2JhbF9rb2JqX3JlbGVhc2Uoc3RydWN0IGtvYmplY3QgKmtvYmopCiAJCWNvbnRhaW5lcl9v
Zihrb2JqLCBzdHJ1Y3QgdHRtX2JvX2dsb2JhbCwga29iaik7CiAKIAlfX2ZyZWVfcGFnZShnbG9i
LT5kdW1teV9yZWFkX3BhZ2UpOworCisJbWVtc2V0KGdsb2IsIDAsIHNpemVvZigqZ2xvYikpOwog
fQogCiBzdGF0aWMgdm9pZCB0dG1fYm9fZ2xvYmFsX3JlbGVhc2Uodm9pZCkgZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21lbW9yeS5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fbWVtb3J5LmMKaW5kZXggODYxNzk1OC4uNzEyOGJiZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fbWVtb3J5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fbWVt
b3J5LmMKQEAgLTIyOSw5ICsyMjksMTcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzeXNmc19vcHMg
dHRtX21lbV9nbG9iYWxfb3BzID0gewogCS5zdG9yZSA9ICZ0dG1fbWVtX2dsb2JhbF9zdG9yZSwK
IH07CiAKK3ZvaWQgdHRtX21lbV9nbG9iX2tvYmpfcmVsZWFzZShzdHJ1Y3Qga29iamVjdCAqa29i
aikgeworCXN0cnVjdCB0dG1fbWVtX2dsb2JhbCAqZ2xvYiA9IGNvbnRhaW5lcl9vZihrb2JqLCBz
dHJ1Y3QgCit0dG1fbWVtX2dsb2JhbCwga29iaik7CisKKwltZW1zZXQoZ2xvYiwgMCwgc2l6ZW9m
KCpnbG9iKSk7Cit9CisKIHN0YXRpYyBzdHJ1Y3Qga29ial90eXBlIHR0bV9tZW1fZ2xvYl9rb2Jq
X3R5cGUgPSB7CiAJLnN5c2ZzX29wcyA9ICZ0dG1fbWVtX2dsb2JhbF9vcHMsCiAJLmRlZmF1bHRf
YXR0cnMgPSB0dG1fbWVtX2dsb2JhbF9hdHRycywKKwkucmVsZWFzZSA9IHR0bV9tZW1fZ2xvYl9r
b2JqX3JlbGVhc2UsCiB9OwogCiBzdGF0aWMgYm9vbCB0dG1fem9uZXNfYWJvdmVfc3dhcF90YXJn
ZXQoc3RydWN0IHR0bV9tZW1fZ2xvYmFsICpnbG9iLAotLQoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
