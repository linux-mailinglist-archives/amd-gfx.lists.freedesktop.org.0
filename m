Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F47182BEF
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 08:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137CB89DC0;
	Tue,  6 Aug 2019 06:46:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790043.outbound.protection.outlook.com [40.107.79.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A171389DC0
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 06:46:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obFqXYzwEWKaT+NWu4CgQP0px9mfMyKjuR1RxPRCaNHtYm0HIQKJLePPqV/xHHoOwfpf4zIngyu0vGv7Q06SCByJ/+fWhcbkiQRy4X5BdaxUrYfdm638jSsDkps46+m7icUHdAHZ22/bzGkvtf87gMileBwqLgN/r/u2gL9G1l0ujPMAc8Jy5kWFXP9JcleDZrgca1KyTM0r5KbVj9V+a4MhFIPpg7/PjHxKYR/4kz7ST17xHZggecf055wAb1jFtYoGouatvoXFK3Vg5xEsm4WLAuqp5mjE2tRrFu/ICXF1RYsUHJ3dSwQ+iM0HRiQj5uJcz4BkMXkeIWzjAcCR3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtqiqJEzV+Yx4cmnUksrCHazvEz2e0mVjDJuRandrUU=;
 b=cKMWJcNkm6SpJGBgHVVxIYb7nWMeK0jU3Oki+fLw6kH6zd2mGVrHvUvS3GNHpXkJNHAIIjjBHR1NiMr+Op7kIWHeIgqZanU9qozCVMykOfoRnSWHKhqu5Gke53rRhPPEq65xck4BJTtLMuVTPQoN2sehLvaoU75CT79VO8C2qCbiqSSF8N44MZ5/hbpDyfu2VWZw/M3omC19qQtyosWbQtadx+0Ew/N2JwzT82tl31bx46x4MGZK6yaZsZK7rssVOnDeYyJ93LXRnfbSUvQPjncB0IuZIvBwcc0Azx7GlLv+An3hj4ememx/x4PcRsuYvXL0Y+hHv07EyI9BALqq0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3540.namprd12.prod.outlook.com (20.179.67.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Tue, 6 Aug 2019 06:46:28 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 06:46:28 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/10] drm/amdgpu/sdma5: set sdma clock gating for navi12
Thread-Topic: [PATCH 03/10] drm/amdgpu/sdma5: set sdma clock gating for navi12
Thread-Index: AQHVTCKsMqT1I2GB7Ue/LWenqkrSkA==
Date: Tue, 6 Aug 2019 06:46:28 +0000
Message-ID: <20190806064546.19434-4-xiaojie.yuan@amd.com>
References: <20190806064546.19434-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190806064546.19434-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0001.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::13) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 474500fc-0d5d-4226-09eb-08d71a39cea3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3540; 
x-ms-traffictypediagnostic: BN8PR12MB3540:
x-microsoft-antispam-prvs: <BN8PR12MB35408D5E9382BDF75BA8F69289D50@BN8PR12MB3540.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(189003)(199004)(5660300002)(50226002)(8676002)(71190400001)(71200400001)(8936002)(6512007)(81166006)(6916009)(86362001)(25786009)(53936002)(316002)(4326008)(81156014)(54906003)(446003)(26005)(76176011)(11346002)(2616005)(68736007)(14444005)(66066001)(2501003)(102836004)(186003)(3846002)(99286004)(52116002)(6506007)(2351001)(256004)(486006)(1076003)(14454004)(36756003)(476003)(66476007)(305945005)(5640700003)(386003)(478600001)(6486002)(64756008)(66446008)(66556008)(6116002)(2906002)(4744005)(66946007)(6436002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3540;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZWyk/MHbBe+9BExiPTHxha40lgNaUxbDuG4OmB7N1sKyK3bOnKeyL8bR9u3uBzanQMci9UvanQjVNA7NfT5GoWP0nX0qs4+/9Oa4mbwq6ti4kZS4V6iRP989CBP8JVIK8pl1ftqRN3GphO+18wknflBRYGqkFvTzzUrlhqBi/aL2mMuXrFl4Z16fuJWDhV1axdiQOA33KiI9Uj8iZ7VVYPWRP7wxorSK8AKtX5OQZk9QU2ociL3lqbX42zauseH/gPsmiJxS7wZtu3rQsYinPvgCc1i7HhRtwBvYiw+MEOSfiE4+VGHnN6yTxHcEi2u9FNuE7oKzmiYx+u4oDtDwNqxzIPDyA228uyLNi4UqyHvnDxo7iWrG9ykVxGQILT1a8RhC1y0knnQg1U+R1rggwHrve7epHNLo8Ei/ODjM8VU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 474500fc-0d5d-4226-09eb-08d71a39cea3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 06:46:28.2431 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3540
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtqiqJEzV+Yx4cmnUksrCHazvEz2e0mVjDJuRandrUU=;
 b=IZ6giOK/j20LAVpIl8DLf5Cn7t/Cdt8KluGwQxsUXJ+LkTrD2pNhebmSmicoA1rgDDFSJaRXmeV/zNy0vNyheU/QyPJip93sv3eEPyaI/n7iiRjSDlMcFe3lVAaN1WetJOsiEP/cjdlBgdOjBoMmsAoJ4v5z4hwoORDk+S9kop0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YWRkIG5hdmkxMiBkZWZpbmUKClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55
dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMgfCAx
ICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc2RtYV92NV8wLmMKaW5kZXggMmE5NTEyMTMyNTIwLi5hNTRlZTMyMDk2MWUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jCkBAIC0xNDkxLDYgKzE0OTEsNyBAQCBzdGF0
aWMgaW50IHNkbWFfdjVfMF9zZXRfY2xvY2tnYXRpbmdfc3RhdGUodm9pZCAqaGFuZGxlLAogCiAJ
c3dpdGNoIChhZGV2LT5hc2ljX3R5cGUpIHsKIAljYXNlIENISVBfTkFWSTEwOgorCWNhc2UgQ0hJ
UF9OQVZJMTI6CiAJCXNkbWFfdjVfMF91cGRhdGVfbWVkaXVtX2dyYWluX2Nsb2NrX2dhdGluZyhh
ZGV2LAogCQkJCXN0YXRlID09IEFNRF9DR19TVEFURV9HQVRFID8gdHJ1ZSA6IGZhbHNlKTsKIAkJ
c2RtYV92NV8wX3VwZGF0ZV9tZWRpdW1fZ3JhaW5fbGlnaHRfc2xlZXAoYWRldiwKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
