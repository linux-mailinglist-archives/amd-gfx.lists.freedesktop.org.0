Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037BAB73D0
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEA36F955;
	Thu, 19 Sep 2019 07:13:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982616F958
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:13:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ufd4Xe8eHeNhgNiLak9zJrr/jgobIgTrN9FzzB9V+WggNE4LEYWX7lHDYNqawm41ijq4DhOqK/5KN8c6gCrCRHYli56g8m6Lz2rFsigmn5siMHTVeWRFdgeD4+DGJrlvt5IKuOeSo35JBfHEcMx6Vil5Y2NoPlM7dcX3AkB/rgh9sr3Vj/KwF7RCJB+6TGDfyGV0ADVJpTeqIIgFlNGpqP6A9C4DeMDSyZFCWxVq3cLw+oev2QZ9FC84oxGwd9/Pb6seMmDIpnkc9bYkzqB1cpoHrMr66kkt2snGK832jfrbYQ/ueW3EQPLu+/oY/I/YuaMGZufuPmTkzpp3r6lKRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=da5spx2e51Ir09nsIs6WgIzKmB4CCJIzf7dV62VsKPw=;
 b=cdqFXNYgvMMquElrNGRwf3sbiW7K4ofsrN6UveKqaS0FFzXWWoaYAXJG07JDsqbu7TJ+7sDPAUK0UjiuvHWuOWb38dFj84+ftu79nQdMi4YVXWKOT94EA/VQ6TgnpCYIt6tbMXuzb7LUNn6jjp7gvC7FlQRKXBi+GjA/zWcfIduTKPlfviNUd9RacWuCFJ0w6Otg0doR5DeV95tmdi1COXB9ZCR6BREJVCx/EA4S8z5cFRX5XD2zxiqd4M9jV4eSN0Q/Z5iOEvXCbg2FW6mTeqES83yzq7tdg/sWKREVX8gQz9bwSFqAWAlMyr4TTo7/yhD5wvk0irN/jyK9rhidRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB2894.namprd12.prod.outlook.com (20.179.84.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 07:13:03 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:13:03 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 15/21] drm/amdgpu: simplify the access to eeprom_control struct
Thread-Topic: [PATCH 15/21] drm/amdgpu: simplify the access to eeprom_control
 struct
Thread-Index: AQHVbrmt91kZBlhNnkObcKQBtEb9mg==
Date: Thu, 19 Sep 2019 07:13:02 +0000
Message-ID: <20190919071115.16552-16-tao.zhou1@amd.com>
References: <20190919071115.16552-1-tao.zhou1@amd.com>
In-Reply-To: <20190919071115.16552-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0092.apcprd03.prod.outlook.com
 (2603:1096:203:72::32) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b498af82-34ad-46d4-024d-08d73cd0cf48
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2894; 
x-ms-traffictypediagnostic: MN2PR12MB2894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2894C350894877A174B9CFCDB0890@MN2PR12MB2894.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(186003)(6506007)(102836004)(6512007)(316002)(8676002)(81156014)(64756008)(446003)(2501003)(52116002)(11346002)(476003)(2616005)(66446008)(86362001)(8936002)(5660300002)(66946007)(66476007)(81166006)(66556008)(50226002)(3846002)(2906002)(486006)(76176011)(99286004)(110136005)(6116002)(25786009)(7736002)(256004)(1076003)(66066001)(26005)(14454004)(386003)(6436002)(6486002)(4326008)(478600001)(71190400001)(71200400001)(6636002)(305945005)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2894;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4gSFsncCpUmK5Kz+wC0MAH4qE/DeLuT1LVPFTU0BvyTzH+hLNToDjLslTaIpqgLiuvf4ERCkt5CJ8jftYiOwtCCupfP15aH+n3onfdTwGu6HbDdSYBN7KFiagkB4fr1Bfm4w2Z2VImm5nhpk7zAxro+UAEcClO0r94mklDLyUh2d9ohTjs/cht90ih/T+BwtGy/xMffWDoKA3hEJMFDCuYZzNK/ZIJlvfI2KtI40nz0i2iDMqdvvJ2PNInHDbliPSgKdTroZlOlKDtjNPHaCDoC8rDy2j2Je8INLKtoEqvrMAeyAiEFkIdiovuNjeTdJXHZPtniLffJhK+Sm6TmAcoeLfkFAlqOIEW73kmq3QLzrya5TRf35ghKuVlVKw1p93vS6x41efOZojYJNh/ZBd+LUBOG+l9dh5nqGcatOqW8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b498af82-34ad-46d4-024d-08d73cd0cf48
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:13:03.1507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7zoQ5QHXpJfnUd/KiTqqhY6Uxny+zBQgvCWRopCN6UTZ2x0KRwlX/YXk98k3T23g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2894
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=da5spx2e51Ir09nsIs6WgIzKmB4CCJIzf7dV62VsKPw=;
 b=WLIL3SYlX30eHMTGHfQx2FxjwIbzo+o+CZU0gBmAQKYH/Pl8k9qF3G3Mh959XGtXDjocOsj4vDTs7AVToQQceHaKs3JXFx+5es4TB0TRIawm6XANpYQXg7IJzQGfEzQR5tsy/aRFXE6APvaLUKjoBdpvklf0NC+RAVmQplDWReo=
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

c2ltcGxpZnkgdGhlIGNvZGUgb2YgYWNjZXNzaW5nIHRvIGVlcHJvbV9jb250cm9sIHN0cnVjdAoK
U2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuYwppbmRleCBmNzJjOWYwMTFmZmEuLjYxZDAyZTVjZmMxNCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwpAQCAtMTM0NSw3ICsxMzQ1LDcgQEAg
c3RhdGljIGludCBhbWRncHVfcmFzX3NhdmVfYmFkX3BhZ2VzKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQogCXNhdmVfY291bnQgPSBkYXRhLT5jb3VudCAtIGNvbnRyb2wtPm51bV9yZWNzOwog
CS8qIG9ubHkgbmV3IGVudHJpZXMgYXJlIHNhdmVkICovCiAJaWYgKHNhdmVfY291bnQgPiAwKQot
CQlpZiAoYW1kZ3B1X3Jhc19lZXByb21fcHJvY2Vzc19yZWNvZHMoJmNvbi0+ZWVwcm9tX2NvbnRy
b2wsCisJCWlmIChhbWRncHVfcmFzX2VlcHJvbV9wcm9jZXNzX3JlY29kcyhjb250cm9sLAogCQkJ
CQkJCSZkYXRhLT5icHNbY29udHJvbC0+bnVtX3JlY3NdLAogCQkJCQkJCXRydWUsCiAJCQkJCQkJ
c2F2ZV9jb3VudCkpIHsKQEAgLTE0ODMsMTEgKzE0ODMsMTEgQEAgaW50IGFtZGdwdV9yYXNfcmVj
b3ZlcnlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlhdG9taWNfc2V0KCZjb24t
PmluX3JlY292ZXJ5LCAwKTsKIAljb24tPmFkZXYgPSBhZGV2OwogCi0JcmV0ID0gYW1kZ3B1X3Jh
c19lZXByb21faW5pdCgmYWRldi0+cHNwLnJhcy5yYXMtPmVlcHJvbV9jb250cm9sKTsKKwlyZXQg
PSBhbWRncHVfcmFzX2VlcHJvbV9pbml0KCZjb24tPmVlcHJvbV9jb250cm9sKTsKIAlpZiAocmV0
KQogCQlnb3RvIGZyZWU7CiAKLQlpZiAoYWRldi0+cHNwLnJhcy5yYXMtPmVlcHJvbV9jb250cm9s
Lm51bV9yZWNzKSB7CisJaWYgKGNvbi0+ZWVwcm9tX2NvbnRyb2wubnVtX3JlY3MpIHsKIAkJcmV0
ID0gYW1kZ3B1X3Jhc19sb2FkX2JhZF9wYWdlcyhhZGV2KTsKIAkJaWYgKHJldCkKIAkJCWdvdG8g
ZnJlZTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
