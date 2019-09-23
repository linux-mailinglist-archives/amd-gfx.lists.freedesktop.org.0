Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5460BAFD6
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 10:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1CC6E249;
	Mon, 23 Sep 2019 08:43:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690057.outbound.protection.outlook.com [40.107.69.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974956E248
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 08:43:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXYn9wSTkkQWUyWIEXlW6d+YHqXWtmWEED5EkVfc7EMCFgvqNKsmQDjhrYjPxLGj84NcUzbieLSkUS7mBuLKXoW20iRrmlpo+37yZGxczUp/PSIHqAkgm9zpjdXyiRn4tn/4/JQWgi7Sbiuu/VAt5Bqc7inGSYYfW0j+8PmYwOuDiXH5Z23iatsSZo3ZrL662mFdn1BgxNoq3J6p/JT3fXVjxcToK57Pl/CLXD+JBuzkMUh4HP+85FwrAYnHsFHV2QfxIJkejBjMuqgAFdPpJyFlADqCrfX4MQJiGvJMlVOXIuJD8GH+PTj2tsahzJM4rvjfs3pnSN/5J4O8BJAeeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEcMS2WXUN0vY9MomWhcvBNQOe2oqiBbglv1pmDiRcM=;
 b=IkMrbsv7hibDd8aZoOeWOxPw6MeQFpMXkuQjUN2aAeZLMA4DknE2NG5keId2V5OO4oz4TfUT37JyONPurRZ1lvtsZkG+Ae3vjIAM6gp2eVL9gOvv/APJDCzABD+mJIGA66LYZbUwrwDo0rbJ3blQ3PxgojdTFzg2tE7gHw6Hjd0p837BxDOVBBzbSHDJ9CIS67BtO0bFaIhh4ZvALMgjzM/nyJ391Idlo6exdxHTQdBXe9bA4chfvQfuHR0KuyyX/vBQrPivWrP2iNKa38qiLMUB0iAolzd1VuiEUPkV+yTPJQKKVucw5Xy12udScPg2z/MH7eYM2y/ExXo8V0IzPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3392.namprd12.prod.outlook.com (20.178.242.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.21; Mon, 23 Sep 2019 08:43:11 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 08:43:11 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/5] drm/amd/powerplay: add interface for getting workload type
Thread-Topic: [PATCH 3/5] drm/amd/powerplay: add interface for getting
 workload type
Thread-Index: AQHVceruP9GnrbfLZUiYK/iUbYR6hA==
Date: Mon, 23 Sep 2019 08:43:11 +0000
Message-ID: <1569228167-3120-3-git-send-email-Prike.Liang@amd.com>
References: <1569228167-3120-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1569228167-3120-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR03CA0050.apcprd03.prod.outlook.com
 (2603:1096:202:17::20) To MN2PR12MB3536.namprd12.prod.outlook.com
 (2603:10b6:208:104::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0caa1db-4e0c-4112-0621-08d7400210bc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3392; 
x-ms-traffictypediagnostic: MN2PR12MB3392:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB33925F2A0E4FF54C779F87DEFB850@MN2PR12MB3392.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(189003)(199004)(4326008)(2906002)(50226002)(305945005)(8936002)(6916009)(476003)(36756003)(3846002)(7736002)(6116002)(76176011)(446003)(102836004)(11346002)(99286004)(66066001)(52116002)(486006)(386003)(2351001)(71200400001)(2501003)(71190400001)(26005)(81156014)(66946007)(2616005)(6486002)(6506007)(6436002)(186003)(5640700003)(66556008)(64756008)(86362001)(6512007)(478600001)(14444005)(8676002)(81166006)(14454004)(256004)(316002)(25786009)(5660300002)(66446008)(66476007)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3392;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5YU+5CylLEdYABYlAUWtIPPVb10SP4qrPWYbWCqV1FeZ1R9fv25cG+SUruHIjpu94uDx68gJeY6UclfBn0i1M6cqvXiWypA/BIK9YE6//3L5KxWYRi6zAk4ILyETPgMDvkfWU3eThAPQUVEvkz79aC5Aa5F7P6Eu69HYmAkzFkzsB3y7vOUcPzHHu1/rugsU00VP4r4QcAGulElzxHOSniO7ogHM1DAAFJZjTC/R9NqrbjzvC/zgl8Y4GrX73ZBpq/AZ1uGW26I3z/njaQ9Hh3F7WW76Ut4/uw8rbd7q/iO/RHWFVwbrMvQ1hkGWe3XVcFnRQBiI7d0T5gYs3wMT3a1xTTxRdKM3MTABStBu/nIjM3zbJQg7TbgoJDS8Sk8d3EIA2ENqB6FkPcTw9vnzdG6lGHD9wC2U+/DNzTTrq1s=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0caa1db-4e0c-4112-0621-08d7400210bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 08:43:11.3383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rHCxbcx+amxDSBcbyOGUX7RDXDBL3NoMdRK0JI+DKoMveDxccJyEoAezXJd4KA6q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3392
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEcMS2WXUN0vY9MomWhcvBNQOe2oqiBbglv1pmDiRcM=;
 b=lXwGohusARV7EbdoZiqLtXgmobbgfkjDRF6KWw/bQRgdQo71z13CWAsWeChTcHF9VsVnRXSI6UjEAsv7GWqa6aMl4W3YYrf6SfEUNUhSg8EolGTWqiajSQcO6w5BUeYKtgUZUzlsVlLDuwc2038cLv7Xx9RtATx9RgqTZp09U8w=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Cc: "arron.liu@amd.com" <arron.liu@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Liang, Prike" <Prike.Liang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHdvcmtsb2FkIHR5cGUgd2FzIGdvdCBmcm9tIHRoZSBpbnB1dCBvZiBwb3dlciBwcm9maWxl
IG1vZGUuCgpTaWduZWQtb2ZmLWJ5OiBQcmlrZSBMaWFuZyA8UHJpa2UuTGlhbmdAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMgfCAyOSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMKaW5kZXggNGJi
N2UxYy4uZjg3YWE1NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
cmVub2lyX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9w
cHQuYwpAQCAtMzY0LDYgKzM2NCwzNCBAQCBzdGF0aWMgaW50IHJlbm9pcl91bmZvcmNlX2RwbV9s
ZXZlbHMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpIHsKIAlyZXR1cm4gcmV0OwogfQogCitzdGF0
aWMgaW50IHJlbm9pcl9nZXRfd29ya2xvYWRfdHlwZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwg
dWludDMyX3QgcHJvZmlsZSkKK3sKKworCXVpbnQzMl90ICBwcGxpYl93b3JrbG9hZCA9IDA7CisK
Kwlzd2l0Y2ggKHByb2ZpbGUpIHsKKwljYXNlIFBQX1NNQ19QT1dFUl9QUk9GSUxFX0ZVTExTQ1JF
RU4zRDoKKwkJcHBsaWJfd29ya2xvYWQgPSBXT1JLTE9BRF9QUExJQl9GVUxMX1NDUkVFTl8zRF9C
SVQ7CisJCWJyZWFrOworCWNhc2UgUFBfU01DX1BPV0VSX1BST0ZJTEVfQ1VTVE9NOgorCQlwcGxp
Yl93b3JrbG9hZCA9IFdPUktMT0FEX1BQTElCX0NPVU5UOworCQlicmVhazsKKwljYXNlIFBQX1NN
Q19QT1dFUl9QUk9GSUxFX1ZJREVPOgorCQlwcGxpYl93b3JrbG9hZCA9IFdPUktMT0FEX1BQTElC
X1ZJREVPX0JJVDsKKwkJYnJlYWs7CisJY2FzZSBQUF9TTUNfUE9XRVJfUFJPRklMRV9WUjoKKwkJ
cHBsaWJfd29ya2xvYWQgPSBXT1JLTE9BRF9QUExJQl9WUl9CSVQ7CisJCWJyZWFrOworCWNhc2Ug
UFBfU01DX1BPV0VSX1BST0ZJTEVfQ09NUFVURToKKwkJcHBsaWJfd29ya2xvYWQgPSBXT1JLTE9B
RF9QUExJQl9DT01QVVRFX0JJVDsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJcmV0dXJuIC1FSU5W
QUw7CisJfQorCisJcmV0dXJuIHBwbGliX3dvcmtsb2FkOworfQorCiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHBwdGFibGVfZnVuY3MgcmVub2lyX3BwdF9mdW5jcyA9IHsKIAkuZ2V0X3NtdV9tc2dfaW5k
ZXggPSByZW5vaXJfZ2V0X3NtdV9tc2dfaW5kZXgsCiAJLmdldF9zbXVfdGFibGVfaW5kZXggPSBy
ZW5vaXJfZ2V0X3NtdV90YWJsZV9pbmRleCwKQEAgLTM3NSw2ICs0MDMsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgcmVub2lyX3BwdF9mdW5jcyA9IHsKIAkuZHBtX3NldF91
dmRfZW5hYmxlID0gcmVub2lyX2RwbV9zZXRfdXZkX2VuYWJsZSwKIAkuZm9yY2VfZHBtX2xpbWl0
X3ZhbHVlID0gcmVub2lyX2ZvcmNlX2RwbV9saW1pdF92YWx1ZSwKIAkudW5mb3JjZV9kcG1fbGV2
ZWxzID0gcmVub2lyX3VuZm9yY2VfZHBtX2xldmVscywKKwkuZ2V0X3dvcmtsb2FkX3R5cGUgPSBy
ZW5vaXJfZ2V0X3dvcmtsb2FkX3R5cGUsCiB9OwogCiB2b2lkIHJlbm9pcl9zZXRfcHB0X2Z1bmNz
KHN0cnVjdCBzbXVfY29udGV4dCAqc211KQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
