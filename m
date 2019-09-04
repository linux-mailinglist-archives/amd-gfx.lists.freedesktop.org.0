Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F77AA8627
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 17:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F7789BF4;
	Wed,  4 Sep 2019 15:48:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810055.outbound.protection.outlook.com [40.107.81.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C4789BF4
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 15:48:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqAW4vkms9yiTt5ALqUGz4/CvRNdG38/n4buazzPGrYtbr1D53rGfLgUpJcJeUBXWFEnii8uEulvAUdfxOmdsgvy0wDYrCgVKnIy9yIUMdifrS6npsM+O4oNeyRNG5Ls/aVSCu2go1bbz3urKQeyMuWNFRqcynGgqHPy5QTiOYrVloIV1N44Tul2TVHVzkHuKEeeuGilhw1wUF78Z2893B4E6jmY0OMWpLwR1/6gigRyJ2xhE0uCK+85jfxpHleXdRGpwsF2LcEf2MAaG6QmhvWKVCtQCaeFBE4HvSCJYtgNx2UB0SxapYJpahdIu0uUE8QFMOL2ECsvkTY7nmCJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XS6Fkm7rinnbeIQUZ7sLPeJZhENMpROCAIcRv7VkHSc=;
 b=Gsc6fkgdsMtVkZopxduEHvEmBJ6Bh9o/o9h047Wq6udU2EsSeru4cp68C3V0MjaoqcaHl6ohiGFtK3XmJX/v0PG9iTveGZvHprt6wGbQcEbGQMN9GwIT8UvBqduwfZFubPxfg+k3No8RGORYX+i1pwnw+fbdSJ1SGyTIGjn2aAtAZgpSGcJKbEHoOH6umWSzZflCicP6IluU2nU2f18uJkYTlXhMh+EIgGd19qZWvFtfcwG8oflo6Bj7Bg2Ze+/Q05LmbyQ3csTQXt58bxn9LIa8H98xnGqr+79drUTZmiAr7oAsnVjiCslU7GdtWn805jxhWwua3D1H3nGOeJhr+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB2863.namprd12.prod.outlook.com (20.179.82.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 15:48:27 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 15:48:27 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/10] drm/amdkfd: enable kfd device queue manager v9 for
 renoir
Thread-Topic: [PATCH 03/10] drm/amdkfd: enable kfd device queue manager v9 for
 renoir
Thread-Index: AQHVYzgxSqXBt9dJ4Ey7uVRZ9d7fIQ==
Date: Wed, 4 Sep 2019 15:48:27 +0000
Message-ID: <20190904154803.5102-4-ray.huang@amd.com>
References: <20190904154803.5102-1-ray.huang@amd.com>
In-Reply-To: <20190904154803.5102-1-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::34) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c25f8cd-9286-4d6c-a974-08d7314f53ac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2863; 
x-ms-traffictypediagnostic: MN2PR12MB2863:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB28638F9BFCD74CD5FE4CCE92ECB80@MN2PR12MB2863.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(66446008)(99286004)(64756008)(305945005)(66556008)(66476007)(66946007)(6436002)(5640700003)(86362001)(7736002)(3846002)(6116002)(486006)(256004)(6916009)(5660300002)(8676002)(2351001)(4326008)(6506007)(386003)(14454004)(316002)(54906003)(6486002)(11346002)(76176011)(478600001)(446003)(53936002)(52116002)(26005)(71190400001)(71200400001)(102836004)(66066001)(1076003)(186003)(36756003)(8936002)(25786009)(4744005)(50226002)(81156014)(2501003)(81166006)(6512007)(2616005)(476003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2863;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Qaqv+cp+8XFKnDgXZ313Q6xhQ1OKKnZvoxVzSZ4dD9/5DaY1zXEJAA4acZJywGCarFNMTrUsiIOX1j2nVnlImx/OnIqYgyiaIj+7dvhmVUCeXxfIRI1uOFlA+lIbyKTW52+gSik0pitrw2zqtkgC9uyHtLOVikjOH79K22wEYzDcWrULDIjJre1vBDyUVuYXuX1yL3L8wCYAEMcRFoV6C1LVpD4mdk+MT6gARt8o7k0OO4sLNVJInJfnaBUaAFsMCmDs+DeVZ02yicpJF6BTOHbudabMGyvdHBxv8NbbyPoAea2kadzQGdT4AF/Gwd183AWrKK1snvngmruyOPnWxKbK4eaI9DQW37p3mMH5EPo9a4WxdeLjK2VXnLcDZnbdwmDM4nurxFvNyRe6rtWS1QI+0p5W5vOx5r0xxvkqQAQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c25f8cd-9286-4d6c-a974-08d7314f53ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 15:48:27.5534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uG03XcjcsysfSsVer+45/BA4lRwFZSmRmX+jioW6KD2HMGWp/fF5HnRJxCTFNYQnRuXfDp/QgzQ8E/Hue0ffkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2863
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XS6Fkm7rinnbeIQUZ7sLPeJZhENMpROCAIcRv7VkHSc=;
 b=zd4oCymhRK2pf3S+9qH9RVlwEawtjVAAq4HQv1VhDyIg3UVw6WDTrTFymRESJqe0nJoDAYx0LYuh3w00JY0JehePJYJwxONOyCm5yiG4nM4lYD2LlByHyQwgEO56wTFC7zR0X4wOPCofifY5y0KVqIKwt+wp+/L0vGNHxSUDceg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVub2lyIGlzIEdGWDksIHNvIGVuYWJsZSB2OSBkZXZjaWUgcXVldWUgbWFuYWdlci4KClNpZ25l
ZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCAxICsKIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMKaW5kZXggMDdjYWVkYS4uZGM5NTlkYSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9t
YW5hZ2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1
ZV9tYW5hZ2VyLmMKQEAgLTE4NDgsNiArMTg0OCw3IEBAIHN0cnVjdCBkZXZpY2VfcXVldWVfbWFu
YWdlciAqZGV2aWNlX3F1ZXVlX21hbmFnZXJfaW5pdChzdHJ1Y3Qga2ZkX2RldiAqZGV2KQogCWNh
c2UgQ0hJUF9WRUdBMTI6CiAJY2FzZSBDSElQX1ZFR0EyMDoKIAljYXNlIENISVBfUkFWRU46CisJ
Y2FzZSBDSElQX1JFTk9JUjoKIAkJZGV2aWNlX3F1ZXVlX21hbmFnZXJfaW5pdF92OSgmZHFtLT5h
c2ljX29wcyk7CiAJCWJyZWFrOwogCWNhc2UgQ0hJUF9OQVZJMTA6Ci0tIAoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
