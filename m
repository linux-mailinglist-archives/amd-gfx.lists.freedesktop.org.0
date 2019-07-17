Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27206BEAA
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 16:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0416E0B8;
	Wed, 17 Jul 2019 14:59:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710041.outbound.protection.outlook.com [40.107.71.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F8B6E0B8
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 14:58:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5tM+lkdOXPITLWLJSCnEv+So6ZDkwi54GsOypXO1TrcVF5RXz/99qNUlEXmHFHlp20WpU2560+0jGYAyEkNEkNrMfSV4tmwyOAdOPEsM9vT9fZB24ACzrLP7pOutrbmclulIHcGCRR/0nY4z8QnN2UTZXRm9cttNv7XTDhdZvOJYpqmczRdkFR7cNA+UstwT4aV1w9Y34Q/ABaOMCTtBQpsAmj9vXVhsB37bSGVCKMnC3K57vxIuYGCwpObCoMgXjPUl9FF1w/GpuSVPpPNwD49WDzxE+n4JLrBFnvn1Feawiq29dlLKGTqpYnKiAncs4bMu+y4PsJd2roSbUAflg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUod13lwTSxu0eKvu9HWktspXmCBp/d3kYADM2VSo5M=;
 b=VgMFuZZxX4/Z7gsi0OE5SLieNccbiyS+YdE86yWzTWc+6IIPlrsfftWiSUE6weippnGdi1WDHnBxbPOo+yYn/ns9oHK1E9tUyE/ZSVhDFLtXeOmc6om4mNpBLA9eA98/SnFfCpETY5jrsClYmQhePVHKx/6jcUJLkCXI5I2RRv1xVfu3hPTo3ETIz6R78pigNF41rjvDnI247jkXkBV8KeIRBbvx34kFSvcD1Sw0RpxogTIcy9JoK97DWE8Oh0ICiqEhnEWiwvQSpZl6uVj1AzdldVSwJFyJxv8Dq4mE/AELgVtgho5ACKi2jY6yy7AFmk9kcQJiSKVGEWT4zGUsBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from CY4PR12MB1767.namprd12.prod.outlook.com (10.175.62.137) by
 CY4PR12MB1751.namprd12.prod.outlook.com (10.175.62.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 14:58:57 +0000
Received: from CY4PR12MB1767.namprd12.prod.outlook.com
 ([fe80::9d27:7add:4f59:7269]) by CY4PR12MB1767.namprd12.prod.outlook.com
 ([fe80::9d27:7add:4f59:7269%5]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 14:58:57 +0000
From: "Greathouse, Joseph" <Joseph.Greathouse@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: Remove GWS from process during uninit
Thread-Topic: [PATCH] drm/amdkfd: Remove GWS from process during uninit
Thread-Index: AQHVPLAo//Ju2ecqbU6HA1LmDKhu1w==
Date: Wed, 17 Jul 2019 14:58:57 +0000
Message-ID: <20190717145830.9004-1-Joseph.Greathouse@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: SN6PR04CA0071.namprd04.prod.outlook.com
 (2603:10b6:805:2a::48) To CY4PR12MB1767.namprd12.prod.outlook.com
 (2603:10b6:903:121::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.78.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33c538c0-16cd-41fc-f095-08d70ac74add
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR12MB1751; 
x-ms-traffictypediagnostic: CY4PR12MB1751:
x-microsoft-antispam-prvs: <CY4PR12MB1751E5BEA2CF2030928389BFF9C90@CY4PR12MB1751.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(189003)(199004)(186003)(8676002)(6486002)(476003)(71190400001)(4326008)(1076003)(14454004)(2501003)(26005)(6512007)(71200400001)(2616005)(5640700003)(6436002)(2906002)(25786009)(64756008)(316002)(53936002)(99286004)(66446008)(66476007)(66556008)(36756003)(6916009)(478600001)(5660300002)(2351001)(7736002)(305945005)(102836004)(386003)(6116002)(66066001)(86362001)(81166006)(81156014)(486006)(6506007)(50226002)(52116002)(66946007)(8936002)(256004)(68736007)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1751;
 H:CY4PR12MB1767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TqR4XE3gJLEzxfMJhfxCGDTng1qzLX3UoBOt4KlIvh1nDcUOc58liOX1Z9wRMiESBesR8NHNM8zOodXkTJ+yTVV2TKpx0ii463zksCnR6RU2yCBqkXyfxk1i/ibrsX69i3WWMQJm7NACb1xFc3bPcPBHX7BLfVJKnr1yy8Ohvr77uxWVmGCLDWtKLtVvFzSuEMgd1i/I8wTJbV1icKoARF5qcBTdSY8WRAcZ4NdGAx9+DyML8/534pG5mP1cFEKq23TFzGUr/M0tcCKT+mreRbCixcQtmCQb7rgwLJzVouycKAfRIDkR5gB9gLalDqEA04x8kgYPZJIi+glWlPcDkx/Wk4cjW3nePupPz1C3M6nBXx2Axyk6zm4vFqOApCshRTs3SLqfekuD/9ZLz3Dx+O7LNIbHbeFhAMFsOTz0obk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c538c0-16cd-41fc-f095-08d70ac74add
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 14:58:57.0691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgreatho@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1751
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUod13lwTSxu0eKvu9HWktspXmCBp/d3kYADM2VSo5M=;
 b=gulBaN9/BUe5S4BuuxS+4m/d4daGqMtmBEbkXmElPC/f0IJfmaj/fRfechXljrQ+UsJyJDl53sSq3/+tzlrBscwx2zmHgZMsrjnip3LLLVCarqnUBF+Lpf0993rw1ddDshm0A+YS0KrjQ/kXAwlwuZ7AUBrVIKFfidRO1U7TWz4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Joseph.Greathouse@amd.com; 
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
Cc: "Greathouse, Joseph" <Joseph.Greathouse@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SWYgd2Ugc2h1dCBkb3duIGEgcHJvY2VzcyB3aXRob3V0IGhhdmluZyBkZXN0cm95ZWQgaXRzIEdX
Uy11c2luZwpxdWV1ZXMsIGl0IGlzIHBvc3NpYmxlIHRoYXQgR1dTIEJPIHdpbGwgc3RpbGwgYmUg
aW4gdGhlIHByb2Nlc3MKQk8gbGlzdCBkdXJpbmcgdGhlIGdwdXZtIGRlc3RydWN0aW9uLiBUaGlz
IGxpc3Qgc2hvdWxkIGJlIGVtcHR5CmF0IHRoYXQgdGltZSwgc28gd2Ugc2hvdWxkIHJlbW92ZSB0
aGUgR1dTIGFsbG9jYXRpb24gYXQgdGhlCnByb2Nlc3MgdW5pbml0IHBvaW50IGlmIGl0IGlzIHN0
aWxsIGFyb3VuZC4KCkNoYW5nZS1JZDogSTA5OGU3YjMxNTA3MGRkNWIwMTY1YmI3OTA1YWVmNjQz
NDUwZjI3ZjIKU2lnbmVkLW9mZi1ieTogSm9zZXBoIEdyZWF0aG91c2UgPEpvc2VwaC5HcmVhdGhv
dXNlQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3Nf
cXVldWVfbWFuYWdlci5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1
ZV9tYW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1
ZV9tYW5hZ2VyLmMKaW5kZXggZGEwOTU4NjI1ODYxLi43ZTZjM2VlODJmNWIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2Vy
LmMKQEAgLTE1MCw2ICsxNTAsOSBAQCB2b2lkIHBxbV91bmluaXQoc3RydWN0IHByb2Nlc3NfcXVl
dWVfbWFuYWdlciAqcHFtKQogCXN0cnVjdCBwcm9jZXNzX3F1ZXVlX25vZGUgKnBxbiwgKm5leHQ7
CiAKIAlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUocHFuLCBuZXh0LCAmcHFtLT5xdWV1ZXMsIHBy
b2Nlc3NfcXVldWVfbGlzdCkgeworCQlpZiAocHFuLT5xICYmIHBxbi0+cS0+Z3dzKQorCQkJYW1k
Z3B1X2FtZGtmZF9yZW1vdmVfZ3dzX2Zyb21fcHJvY2VzcyhwcW0tPnByb2Nlc3MtPmtnZF9wcm9j
ZXNzX2luZm8sCisJCQkJcHFuLT5xLT5nd3MpOwogCQl1bmluaXRfcXVldWUocHFuLT5xKTsKIAkJ
bGlzdF9kZWwoJnBxbi0+cHJvY2Vzc19xdWV1ZV9saXN0KTsKIAkJa2ZyZWUocHFuKTsKLS0gCjIu
MTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
