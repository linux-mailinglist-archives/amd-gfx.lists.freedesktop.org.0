Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F67FA5E59
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 02:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83F889956;
	Tue,  3 Sep 2019 00:02:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800080.outbound.protection.outlook.com [40.107.80.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3D389956
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 00:02:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCnjGWkCSlNmB2KcpVPuXtzZTZ356R7p3Fq/Jah1id1vnLwHj5hdh0LwITS+PqEtHkpsGYy95jqW0Vr5oO0h1UG6eWnAK1Nt+MWZhc30EM0m7ukMudK/WPf+yXwGHQGHc036dVRvUDrsU6Dix62A3wLnPOfBhWURKGW5GkMCmPFqERLDzpkn0xqpVcgvHHRm/hz8CW/XdPVHQ1TvKK0eXIBZBc+YzhmNdDGc7l5SpuNQAM7qvwVu8JSan5QOQ7gqqa8m9tPf+OODkcBlJMrHqH9BiqCcmPVNLlDFpImhMOtXoE1kMwRf3uQs9LFWCniexeHfTWaKV6N9+njnGOsI8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyntYckhXjKFWSS4jK1u/pMb3FffW9Yc0upaRIgEdiw=;
 b=AwPjwbErxj0vliP3O6JRVyWd6OJ8WzlD3jV4Vgytb832aIaB2tqltBrO/mrl0/CaHSd4HZmF6/lxFjmNUiyYwhC6CgcM9TvE3oLwSGdml2jz6xfIBNhAt1wl7ny1xmJPi9EcS2YPBL/ERfwl0ndY6yaYuwifeETpl6EYPizU25Kli3PLXeZswXk7dswAz2HsP8dc8KL9p2CPmIK6GBPApoWr9Oc0WDFdTBPlxlBpOsjYL7zB1ZeV/w7gY+Z4q1WPq7Fw40F5dVWfhpCnzcP3TQl6tWy8Z93j3UEtRShqOoG7dE1hOxUsMyZ+RtH7XJwRxfoCK+dsHfUOJ8T8Vowt7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1818.namprd12.prod.outlook.com (10.175.92.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 3 Sep 2019 00:02:19 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 00:02:19 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 08/10] drm/amdgpu: allow check ras capabiltiy for arcturus
Thread-Topic: [PATCH 08/10] drm/amdgpu: allow check ras capabiltiy for arcturus
Thread-Index: AQHVYeranNl6XoVrnEiXqe9kz+hNVg==
Date: Tue, 3 Sep 2019 00:02:18 +0000
Message-ID: <1567468894-11852-8-git-send-email-Hawking.Zhang@amd.com>
References: <1567468894-11852-1-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1567468894-11852-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0022.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::34) To DM5PR12MB1418.namprd12.prod.outlook.com
 (2603:10b6:3:7a::15)
x-originating-ip: [180.167.199.189]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35bd2f1a-8e97-404f-fb04-08d73001fc7e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1818; 
x-ms-traffictypediagnostic: DM5PR12MB1818:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1818C5C9152751EAFFE0832DFCB90@DM5PR12MB1818.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(199004)(189003)(99286004)(66446008)(36756003)(2501003)(478600001)(316002)(256004)(66946007)(14444005)(5660300002)(66476007)(53936002)(81166006)(26005)(8676002)(71200400001)(102836004)(81156014)(71190400001)(6486002)(66556008)(50226002)(186003)(8936002)(66066001)(25786009)(3846002)(6116002)(76176011)(6512007)(6506007)(386003)(4326008)(86362001)(486006)(446003)(2616005)(305945005)(52116002)(7736002)(11346002)(476003)(110136005)(2906002)(14454004)(6636002)(64756008)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1818;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3uR3lbLz6ewRFEppdTFjTUNZb0yAJJ3YFZvi184ozjnRChfnP0g/nBRtrDr95Q9I2A6Jz2VAyNaQsL1IlGNtpxMtHhrjh8a6oMBbe4k3n2KNsm2/9WrmpgOJ8qng18h30hqOCaZS/I8XHwLovnkkUhGPkIiujXalCy009XUBRAcvu75P0Sk9Nhsg8q7RvTXzBBXI9yR8fFPVHUgRRBWYp/Wk7ygFF4eRBgU0pHb9P3c91aStBN7HlhUPB2M2RfS+nwfB3wtyUJj7hJtQ7MMXY3j7r2ZnD3jay4duKYDKAHptvOeXxXXZ143BNbWwEipZjPUQzXqdeGiCDc3dDbOwJSKE9qxP6Dac1n7nDcBXjQcVHVZFcaEqzAb4wrNnzJ962s/6POEh1V0wvSBsVlDUqw196kryEXHQrl3/uP8lyu8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35bd2f1a-8e97-404f-fb04-08d73001fc7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 00:02:18.9573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VjNyPrB7nsxTs8W8phIb+GSuVyHCgfyxd2379pTSihylzPYAId5AbGN5u6ey743xMDpl/B0Fo+TTDWL42D6jCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1818
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyntYckhXjKFWSS4jK1u/pMb3FffW9Yc0upaRIgEdiw=;
 b=jxBxdV6RoWaeQszxrClg0X9Z/0w2lwARrAYYTKb69EuOOFuuuZGTuqRWOOIKmMUBdfkWWuzDRfE5Z7U/Hl17SroMBDULrZMadfcSzDsh5WmV/gmPz/6ILnD7FJKJrd94ojLrkhrp+TfFo690NYOaeLYOOgFS+ZBsT2QAsxxzpv0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UkFTIHdpbGwgYmUgc3VwcG9ydGVkIG9uIGFyY3R1cnVzLiBUaGUgcGF0Y2ggYWxsb3cgZHJpdmVy
CnRvIGNoZWNrIHJhcyBodyAmIHN3IGF2YWlsYWJsaXR5IG9uIGFyY3R1cnVzLgoKU2lnbmVkLW9m
Zi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDMgKystCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjlfMC5jICAgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5jCmluZGV4IDJjYTM5OTcuLmU0MWI1MzlmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Jhcy5jCkBAIC0xNDg0LDcgKzE0ODQsOCBAQCBzdGF0aWMgdm9pZCBhbWRncHVfcmFz
X2NoZWNrX3N1cHBvcnRlZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkqc3VwcG9ydGVk
ID0gMDsKIAogCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikgfHwKLQkJCWFkZXYtPmFzaWNfdHlw
ZSAhPSBDSElQX1ZFR0EyMCkKKwkJCShhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9WRUdBMjAgJiYK
KwkJCSBhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9BUkNUVVJVUykpCiAJCXJldHVybjsKIAogCWlm
IChhZGV2LT5pc19hdG9tX2Z3ICYmCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwpp
bmRleCA2NTFlYzVkLi44NjIxM2Y2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMKQEAgLTc5Nyw2ICs3OTcsNyBAQCBzdGF0aWMgaW50IGdtY192OV8wX2xhdGVfaW5pdCh2b2lk
ICpoYW5kbGUpCiAJCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CiAJCWNhc2UgQ0hJUF9WRUdB
MTA6CiAJCWNhc2UgQ0hJUF9WRUdBMjA6CisJCWNhc2UgQ0hJUF9BUkNUVVJVUzoKIAkJCXIgPSBh
bWRncHVfYXRvbWZpcm13YXJlX21lbV9lY2Nfc3VwcG9ydGVkKGFkZXYpOwogCQkJaWYgKCFyKSB7
CiAJCQkJRFJNX0lORk8oIkVDQyBpcyBub3QgcHJlc2VudC5cbiIpOwotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
