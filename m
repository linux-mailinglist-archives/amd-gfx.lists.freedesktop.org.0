Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B4884278
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 04:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6586E5CB;
	Wed,  7 Aug 2019 02:31:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730080.outbound.protection.outlook.com [40.107.73.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B736E5CB
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 02:31:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AP0hW7kivQeI0AMbCSXEDRf5eublqVLEvhw1vylFvPBHmgKPdXkcXvX0BcLv3xonJWFwvGgGyOhEUG8VK9BG77UQWVOvNhvG/4wOjm8w30WnY2oz1YXO4YsQidpkMBGLv2R/CtcQlD3/OgHWtS1c3CFhdYpwWYfmiHJiH7QOOGk6qamdOEeUEJKcB9K1Ye0b/aJ9oAVhCzgjzgFLiTVl5i8fecY9tD4D4ENp2bXjlPO3phiPIiMQNghuUQDYutfw+5VxxEzvPSa8SyxedskRRlhofbvKS33ENs6MZpA3sqp3qwir3XaLEb78DPeOxrBeU9pejYYsO3+gj8OSvOReIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnztkfYUCFJ909XGutIjAcGnbfeOL8DXQYybllzsWjg=;
 b=ZO9h3UpJw43a+HqWrrLWKOcTWmJTwNKRemHDN94Rw2fOPNTLFU1bwrzi5/2uXqZ/wRvjwR7TURyOtI99elQiL/KHduCpaFa/gpEX+ZpPa3EazG+9nDqHDj3nlkqkqGoZPcBvgPllpX+HGYxtOq5FBsYU7QUbmSv+rzLUK7A39LTQlQita/9/vcVXyxgkUG0NfgeD7Pq2DpSqO2ptH5K3ehW7MxuWM3gMV8K4p/H8c3hB0uCEJ9QCCwbPJ8YUtzfluTQt1+WRl4u/CnYDW0H0nkB/fNv0VcYzhzMaWQrsdHMeeydmHUkDP4KY6f9cpT1gPBpFsM4FkYijXCFgISG4/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2404.namprd12.prod.outlook.com (52.132.10.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Wed, 7 Aug 2019 02:31:13 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543%7]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 02:31:13 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/5] drm/amdgpu: Support snooped PTE flag
Thread-Topic: [PATCH 4/5] drm/amdgpu: Support snooped PTE flag
Thread-Index: AQHVTMgu7ENSDQBhLkiKjegScBSL0Q==
Date: Wed, 7 Aug 2019 02:31:13 +0000
Message-ID: <1565145062-16674-4-git-send-email-Oak.Zeng@amd.com>
References: <1565145062-16674-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1565145062-16674-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af0c086c-8977-49d1-7281-08d71adf50a8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2404; 
x-ms-traffictypediagnostic: BL0PR12MB2404:
x-microsoft-antispam-prvs: <BL0PR12MB2404B258C1D263A050BD65C680D40@BL0PR12MB2404.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:431;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(366004)(39850400004)(396003)(189003)(199004)(54906003)(5640700003)(2616005)(36756003)(2351001)(64756008)(66476007)(66946007)(186003)(99286004)(66446008)(11346002)(6436002)(66556008)(6486002)(3846002)(26005)(486006)(476003)(76176011)(66066001)(6916009)(6512007)(446003)(2501003)(52116002)(305945005)(86362001)(53936002)(2906002)(102836004)(68736007)(7736002)(6116002)(6506007)(316002)(386003)(4744005)(71200400001)(50226002)(4326008)(81156014)(81166006)(478600001)(71190400001)(5660300002)(14454004)(25786009)(8676002)(8936002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2404;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: B4r9GF/fqgRcmiexxqgAPdGdoABiryh6EATKXUFDPIKSkj9XazDiwmw05qtU3HDdPFoOnolSUmLG3egftRiJkwfAxRlRsmZJrRKaKazoDMWZIXlUyAlC5ZnLyP5MV1ehbTPONUBbMFZTgY5ddBOl3obHXMBjA5VZeeYcv/H9sBp0vUjXwSNUaDGhTsD4YJItTFaSmDhiJaxUVIfWzJ/i/Qh7oX33Bj/Uza8H8/eviw0J2PelRXtmRcZEmNArqo0fb01d+Lo5T6+pCq4y1Mo9IZcq5aFdD4TQpmRApgFKeiGUE0/jkzBxNBLZt5gUIDjhLgGxZDlMnLCk9he6sOeNfUFbSp1i8bXtizMkg+vha8b4KPKaj6ZYJyawhrBZFaY5Yx0c635NySExQRLzDPkJBzhc23a1Pd9xKBbBZClMmn4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af0c086c-8977-49d1-7281-08d71adf50a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 02:31:13.1099 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2404
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnztkfYUCFJ909XGutIjAcGnbfeOL8DXQYybllzsWjg=;
 b=CJSoaEEVleDriSkeWJYi43XdSqhZrbshPsuCgrvcgeSjUZUu6e3rYUnShgVdY/vXgOxhAe4Uo5iz9eLJj6fskRD4uNSk9znSrhsRLc+25FEJNxPol//yPWqmjofpYwgq1dPMlYWYmcbXSFiC4pHUeXIBHEPiwDJ0KmmTXBT8oN4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Keely,
 Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2V0IHNub29wZWQgUFRFIGZsYWcgYWNjb3JkaW5nIHRvIG1hcHBpbmcgZmxhZwoKQ2hhbmdlLUlk
OiBJNzk5ZjY4ZWM3YTVhMWFiZjMyMDc1ZjVlZjMxMDUxNjQxYTBiMzczNgpTaWduZWQtb2ZmLWJ5
OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjlfMC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCBhZGFkN2M0Li44YmVlZmFm
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKQEAgLTYzOSw2ICs2MzksOSBA
QCBzdGF0aWMgdWludDY0X3QgZ21jX3Y5XzBfYXJjdHVydXNfZ2V0X3ZtX3B0ZV9mbGFncyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAlpZiAoZmxhZ3MgJiBBTURHUFVfVk1fUEFHRV9QUlQp
CiAJCXB0ZV9mbGFnIHw9IEFNREdQVV9QVEVfUFJUOwogCisJaWYgKGZsYWdzICYgQU1ER1BVX1ZN
X1BBR0VfU05PT1BFRCkKKwkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9TTk9PUEVEOworCiAJcmV0
dXJuIHB0ZV9mbGFnOwogfQogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
