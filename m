Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA37C971AB
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 07:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5350B6E8FE;
	Wed, 21 Aug 2019 05:48:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710055.outbound.protection.outlook.com [40.107.71.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77586E8FE
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 05:48:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhgUOuAcb3YcD2QlGjdJRG5xWIwrYjm+rFUtBV1b168sLki3IIBKAueq6gedrhQPiQacMGwMkU/K993OjK94QP5sn5eTjWpMj/IHCIRHJmpRJsrn33EF7rHxppp4CfnpgC0lDnyp02tJVg9DwJPFF2blKy6b4wM2iPvBB0iDUSOBh6QXxCCXW96BKb2sZNs5i5N0rDyVJewx6TXZ5l5EQ9Sn6+e99Txu8JAj3JypnpdgCC533lXcg8RIod0teZDVx/RVpzOa4BOdOy0Q1C1cjGiiQEWIX9tA2drwV+Lnl5vqpaZURADs5MEi5hbj2+8YgybQLCTMjEkSB6vH4IYfhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Op3Yb5qeQyMz2XN+5qLQgwr9a+4ygR6I+PK19brGdjE=;
 b=YZhGE7TQTmXo8/eoHwU6qA6r7BQ28lvNcDg/tDtoRx44DXTyKzef6XvcdX7Go09mGzRpTw3qF1IgidbiOX6jhIPswfjhJawY7D9eGcGbQJripPnr72pz07xJUOxUiCd2jz/WzaQV7xWQ7iT4bhoS5bs6/e4DHgvVqg6hcCJj2FEqPzQUqaUT2oj0S7z19yeHeVLtTJmZrTmOn4FC4N6HofFbtVr5vZ3HE5h4GDDSJgvFHMt8KEa7YRicpJojHsODodPX5+k+uYj1L3r+OVZHzV73oJQ/PyaNB76O7boT+1s81Z0e4cXDQD2Z5a4hyRn5T48GsMvTF84GBbhuM/T/Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4189.namprd12.prod.outlook.com (52.135.49.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 05:47:59 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2178.018; Wed, 21 Aug 2019
 05:47:59 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerpaly: fix navi series custom peak level value
 error
Thread-Topic: [PATCH] drm/amd/powerpaly: fix navi series custom peak level
 value error
Thread-Index: AQHVV+P9Cvd8YDBXgkGiVZcdEhFYjQ==
Date: Wed, 21 Aug 2019 05:47:59 +0000
Message-ID: <20190821054739.27092-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0052.apcprd03.prod.outlook.com
 (2603:1096:203:52::16) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4542f396-8e0c-4391-9a64-08d725fb1f4f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4189; 
x-ms-traffictypediagnostic: MN2PR12MB4189:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4189BB66B68AD696A63A8941A2AA0@MN2PR12MB4189.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(199004)(189003)(5640700003)(256004)(64756008)(86362001)(305945005)(26005)(2906002)(50226002)(102836004)(36756003)(25786009)(186003)(4326008)(6512007)(71200400001)(316002)(6486002)(6436002)(6916009)(81156014)(8936002)(8676002)(386003)(3846002)(6506007)(6116002)(66066001)(81166006)(476003)(4744005)(99286004)(7736002)(14454004)(71190400001)(2501003)(53936002)(2616005)(478600001)(66556008)(54906003)(66946007)(52116002)(5660300002)(2351001)(66446008)(1076003)(486006)(66476007)(219204002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4189;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cHg1tZ8YHJ9S07iIyRhdRobVutfZMlZglB6lZl82KSq2U31EZN4IfiEahcUaYheWU4PVPWvOyxPMxog6bHf/jhpkR3qtKACh4jzYNRokjyGHXU/pPRb5K5cXImXnf4MW4ZTd4gWNwPlUEtiiX5r5lABSJ+oKmCLi3t3TKRfw7Sw9oAU61eNPmRRDf5GPQCTZ9liCzxa5ajRID5Z5c3VhfnZUuK2qt74PBi6LjNZ60z94OSo4YvDyAM5+9UBzaAchFmRlaSOaDcpV9Fkyz6YGLdN4opSRabaL5ib3AeidgGTgFiK+fgOm5+Wa1t+Bd82JTKfKminKrsoN0+nFfr5PlFnHHQzYf27EA1FvfzPMAUbdmNNuHCbNesR0ZX/Ac8dpdMI+jBXk0G+9vLPcEG5CYCILztRjKPXcQEfBNtjUKGI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4542f396-8e0c-4391-9a64-08d725fb1f4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 05:47:59.2651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SvZzlvplbxsKAnHcIK1sLdq3onwc6VscKz0A9opgwoFE7YdaEOCvgK05ev5IHn6b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Op3Yb5qeQyMz2XN+5qLQgwr9a+4ygR6I+PK19brGdjE=;
 b=aw5uPgipYXaIYCH6zZWiO44+dEGYNc4NyVvz9HdmMCNgrucjJhKrWvBj5resUF7b2Pv75K4kSrnyWZLCOPj08uPnsGS8WnAS4O004DNtB1f5eLUq+xTnJlOJyaekbKsZ64pNh8tgYpfjxoKvDAZsFhiBtgkQPUQOX6V4zHRRoLM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Zml4IG90aGVyIG5hdmkgYXNpYyBzZXQgcGVhayBwZXJmb3JtYW5jZSBsZXZlbCBlcnJvci4KYmVj
YXVzZSB0aGUgbmF2aTEwX3BwdC5jIHdpbGwgaGFuZGxlIG5hdmkxMiAxNCBhc2ljLAppdCB3aWxs
IHVzZSBuYXZpMTAgcGVhayB2YWx1ZSB0byBzZXQgb3RoZXIgYXNpYywgaXQgaXMgbm90IGNvcnJl
Y3QuCgphZnRlciBwYXRjaDoKb25seSBuYXZpMTAgdXNlIGN1c3RvbSBwZWFrIHZhbHVlLCBvdGhl
ciBhc2ljIHdpbGwgdXNlZCBkZWZhdWx0IHZhbHVlLgoKU2lnbmVkLW9mZi1ieTogS2V2aW4gV2Fu
ZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9uYXZpMTBfcHB0LmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggMDk1NWZl
ODE0NWI5Li5lYjhhZGYzYjBhNWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9u
YXZpMTBfcHB0LmMKQEAgLTE0MjIsNiArMTQyMiwxMCBAQCBzdGF0aWMgaW50IG5hdmkxMF9zZXRf
cGVha19jbG9ja19ieV9kZXZpY2Uoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiBzdGF0aWMgaW50
IG5hdmkxMF9zZXRfcGVyZm9ybWFuY2VfbGV2ZWwoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVu
dW0gYW1kX2RwbV9mb3JjZWRfbGV2ZWwgbGV2ZWwpCiB7CiAJaW50IHJldCA9IDA7CisJc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBzbXUtPmFkZXY7CisKKwlpZiAoYWRldi0+YXNpY190eXBl
ICE9IENISVBfTkFWSTEwKQorCQlyZXR1cm4gLUVJTlZBTDsKIAogCXN3aXRjaCAobGV2ZWwpIHsK
IAljYXNlIEFNRF9EUE1fRk9SQ0VEX0xFVkVMX1BST0ZJTEVfUEVBSzoKLS0gCjIuMjIuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
