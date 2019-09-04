Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 429F9A83E2
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 15:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D430189471;
	Wed,  4 Sep 2019 13:42:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820072.outbound.protection.outlook.com [40.107.82.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE9989471
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 13:42:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8IJbHtjtH59MYZGHGHen5hD7kW7cdh7pb1gNlolVtmiPSMN24+cGetay1VXUQcG06xZnfvV7kIIjZGibhbguHm9suREotGIQQ50lnKjTtmx7/KQ1zyJ0UMNryRhJjuUu86n7Zykk5X1177T+OX/Vzyx1jRSFreoejSH/3LwqinEpV+QTuZP0FOXc1O7ljQqxcyxZtgbrHlYhnq5eDCbkTFJHuPYP6R/ZbEJ1ln1B+zDctXllRrQcHRvvbCLDkYcY6IAsNo2qXEduY3iNHQ2ZShDE7RFya+3KAK3MPOgbr3vIDGZMUZxJRYbqIYIK2d87tcFw17JwpHxNdJYXIa+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VADGrd1XB//hLoaC0vxoVzc1Y6Yzb2wNHG4v+XYk6pk=;
 b=d1mP2d/CEpA/I3VmGjmBSxrNqLx4Op/l34oUoAvGRyDxuS3G67TiThHH9HSFX/VknGZFIboI4P8q4h+F6eWms6l4Pt1E9s6mKKjqKIAxQKhdHso1/BlBEve+02RkFZVS/W0AJOhynZBIwql3KgcBdCCvU7cWvJEx7Lekmav/W4HeQdz6U384J/7tmqBvO7oztB7V8Fu+tEXJThAHWkSfTgdsgSoTaW57q/dFj6BV3SA6T2odAJvhmtqOkV4cFX1Bk5n4GlWXFNen4eij4v1kqqnCgxWMXe3UPk4SA81nWLhrp8FeeaCa35xjTHAS20BV4TnDYFqfvaewjRReb6FJNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB2957.namprd12.prod.outlook.com (20.179.82.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Wed, 4 Sep 2019 13:42:42 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 13:42:42 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Liu, Aaron" <Aaron.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: disable stutter mode for renoir
Thread-Topic: [PATCH] drm/amdgpu: disable stutter mode for renoir
Thread-Index: AQHVYwGt6LIghn8MXU2QjAF8ZHakCKcbhiCg
Date: Wed, 4 Sep 2019 13:42:42 +0000
Message-ID: <MN2PR12MB33096F7F1526B2F7A3C77EA4ECB80@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <1567588678-26926-1-git-send-email-aaron.liu@amd.com>
In-Reply-To: <1567588678-26926-1-git-send-email-aaron.liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8922761-f97a-4e34-d711-08d7313dc292
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2957; 
x-ms-traffictypediagnostic: MN2PR12MB2957:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2957EEF22F5C57D315509406ECB80@MN2PR12MB2957.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(189003)(199004)(13464003)(53546011)(6506007)(26005)(446003)(11346002)(305945005)(486006)(52536014)(7736002)(74316002)(8676002)(33656002)(2501003)(86362001)(81166006)(81156014)(8936002)(476003)(76176011)(102836004)(186003)(6116002)(7696005)(14444005)(76116006)(66946007)(99286004)(66476007)(66556008)(256004)(110136005)(9686003)(66066001)(6246003)(71200400001)(71190400001)(316002)(3846002)(53936002)(66446008)(64756008)(6436002)(25786009)(2906002)(229853002)(5660300002)(4326008)(478600001)(55016002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2957;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8ztFIRxQoj+872fXqOajlCnyONfFKP9Yil2Iol+9QfOSMkWOfbWGBioPR2EDZhOJhESJpbbpGEXKRit6YxHB9QUEpK87UDFuNYCL4wHQUMCpmgjOJbfVi+GbcioAJmluts6JCEqoBvX+YZklphNgJVo80z+PbFM5+OFUE9yStCzsy6N53R56XA1Ris9utm+bh3jK/ai1+cnEIIidy1qpwQ4PsD4Nfrx8SXuD5FpOZ7jaDQYRhO+reEg24WcopRQ560N5Tdvsp7NQk+/aJqRin+zevfS02416rBadG7rLW5FbptESImyFbhCgI+HAVDlU26q8uHHh52LIsmcQzS6CjBaKXndx4lqX0cP7LoYpUEWVDP8MQPdvF13UERdYj37jH0gkOKsysXtb9hRxfEuitX/09rmzpwQdYvem5n2Yjck=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8922761-f97a-4e34-d711-08d7313dc292
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 13:42:42.1904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gqa+v4JJ3vm4C+8YJbxkH3a+sWvrXw4L92TzKRF/X/xjKfhhqyXt3iwK1w13GP9Lys57oeGYCLLxCnxj7xTljw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2957
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VADGrd1XB//hLoaC0vxoVzc1Y6Yzb2wNHG4v+XYk6pk=;
 b=u1RiYPQfomILTIjH0x7aeUcH3Zw+4VZw5gHoQTDzwjKKsvkSFg5J85JiIVx+9leDhqrrtHP2+Oa3F3UwC0FKWXW0Jxz+OIzZEf3tzM9Y83fLhx12WtNQA4KQHJkPqUjJZ5IFA+XH36+0E//J2kjqU88L3a30rvItadlU2nojrFs=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGxlYXNlIGFkZCBhIGNvbW1lbnQgdGhhdCAiZGlzYWJsZSBzdHV0dGVyIGZvciB0aGUgbW9tZW50
IGJlY2F1c2UgTk1JIHdhcm5pbmcgc3Rvcm0sIGFuZCB3aWxsIGVuYWJsZSBpdCBiYWNrIHRpbGwg
dGhlIGlzc3VlIGlzIGFkZHJlc3NlZCIuCgpXaXRoIHRoYXQgZml4ZWQsIHBhdGNoIGlzCgpBY2tl
ZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KCgotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQpGcm9tOiBMaXUsIEFhcm9uIDxBYXJvbi5MaXVAYW1kLmNvbT4gClNlbnQ6IFdlZG5l
c2RheSwgU2VwdGVtYmVyIDQsIDIwMTkgNToxOCBBTQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNv
bT47IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgTGl1LCBBYXJvbiA8QWFyb24uTGl1
QGFtZC5jb20+ClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogZGlzYWJsZSBzdHV0dGVyIG1v
ZGUgZm9yIHJlbm9pcgoKV2l0aCBzdHV0dGVyIG1vZGUgZW5hYmxlZCwgTk1JIHByaW50cyBmcmVx
dWVudGx5LgpEaXNhYmxlIHN0dXR0ZXIgbW9kZSBmb3IgcmVub2lyLgoKU2lnbmVkLW9mZi1ieTog
QWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jCmluZGV4IDcwOGQ1OTUuLjhlMmFmMmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtMjUzOSw2ICsyNTM5
LDggQEAgc3RhdGljIGludCBhbWRncHVfZG1faW5pdGlhbGl6ZV9kcm1fZGV2aWNlKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQogCiAJaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX0NBUlJJ
Wk8gJiYgYWRldi0+YXNpY190eXBlICE9IENISVBfU1RPTkVZKQogCQlkbS0+ZGMtPmRlYnVnLmRp
c2FibGVfc3R1dHRlciA9IGFtZGdwdV9wcF9mZWF0dXJlX21hc2sgJiBQUF9TVFVUVEVSX01PREUg
PyBmYWxzZSA6IHRydWU7CisJaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1JFTk9JUikKKwkJ
ZG0tPmRjLT5kZWJ1Zy5kaXNhYmxlX3N0dXR0ZXIgPSB0cnVlOwogCiAJcmV0dXJuIDA7CiBmYWls
OgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
