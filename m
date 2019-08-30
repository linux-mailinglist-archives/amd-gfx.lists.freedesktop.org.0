Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC923A3776
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 15:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AAC6E339;
	Fri, 30 Aug 2019 13:02:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720044.outbound.protection.outlook.com [40.107.72.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4246E6E339
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 13:02:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUSfWAmEt1Ti2pi64xWS6UltsTpJkeZYQf/mCI6GOhyh0+tIrdwoDP7BqhywPqol9YDerIi3UJZUsa4+NPIRieTCpf8BLv8la6SVcrcEOujMMlIfHN4aC9mEncZEhogGBQjlFVCOvOlsc0X9SLt+GjoHLk1aKLNAFQfm5jAPsg78JZTUbgzaJZ/FeR9QZ9J5LOF26Oos1p4mVsvjWSGkTXP8pfFR6ZVcHZsbrrP2cV/ePUdcCrXTSNBih/bDrxRgTmRTX5hPdWVNVpsdsOyxNRSF5A73a75hYjvMiRB/rIeqLUCObSIp2LgOf0Zq/89svjjgoc/Y1hznSxXcLUQOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oclJXIOFCA7N1X92hPFFvGZuduprv++sGLfFVOf2axM=;
 b=IdAgvTT9B8Vxndhk43U/UMuhF853E2o8Mv1gxZlWm8D+z+rgd39X5puPslYN24K8UdfwJ6ND9DtYrivwoCQ1WUNHGQEEWw5D01qPjpLKtsKVTCSsWgdz5OqOfjQ3eG1X4Gxmp9q0p+TIYj9+IPazt2gp7dM7KGGJoWx9jsxWHuMOWLZynRqRNH0ldSq0n9loedCUVtliVC+6bVOB5xuTrlrxzcw3ut/XIgES9I4GSi4hVHvuZ1HugvGaIl2wwnzqc2UOvEKWbGuODBXsrGKbKdJjsW1ZasAlGnvmCI5oMQICHe04x/2O45yHA81mXRSYlMzOQOvoMNkF5WPDl3zqZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3949.namprd12.prod.outlook.com (10.255.238.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Fri, 30 Aug 2019 13:02:21 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 13:02:21 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Liu, Aaron" <Aaron.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH V2] drm/amd/powerplay: SMU_MSG_OverridePcieParameters is
 unsupport for APU
Thread-Topic: [PATCH V2] drm/amd/powerplay: SMU_MSG_OverridePcieParameters is
 unsupport for APU
Thread-Index: AQHVXtgffyopxrTRnEuJweUSuEFRtacTqIuQ
Date: Fri, 30 Aug 2019 13:02:21 +0000
Message-ID: <MN2PR12MB3309AD0C3ACC62CC20B49640ECBD0@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <1567131024-7241-1-git-send-email-aaron.liu@amd.com>
In-Reply-To: <1567131024-7241-1-git-send-email-aaron.liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.58.27.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54d2566e-9b40-4a36-c198-08d72d4a4b8b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3949; 
x-ms-traffictypediagnostic: MN2PR12MB3949:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB39495BF876C220733F2A56BDECBD0@MN2PR12MB3949.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:334;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(189003)(199004)(13464003)(71190400001)(3846002)(52536014)(64756008)(76116006)(66476007)(33656002)(256004)(5660300002)(14454004)(66446008)(478600001)(102836004)(66066001)(6506007)(53546011)(26005)(186003)(71200400001)(11346002)(25786009)(316002)(476003)(54906003)(110136005)(229853002)(7696005)(66946007)(76176011)(66556008)(99286004)(9686003)(8936002)(86362001)(7736002)(74316002)(81166006)(81156014)(8676002)(2501003)(305945005)(55016002)(53936002)(6436002)(446003)(486006)(2906002)(4326008)(6116002)(6246003)(79990200002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3949;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JeqdKKM4LtgmfeVqipfEY0Q2bhPXcWoLi+8YAKnMKTAwglhGQdifCHujbjEz/zakyA5mPMujRqggZFqecYJJkbc+R3f9S1HmKbeeCEwNtA6bfYCzz+TwnH70aB6HWp6u2gzGl7fJ9IgVFXSIz7nj65V0NxZD13xf+UeqtBJst8sz1TRsc0WqRyP5k2cIH9ht6zIGfvrcVrSOM4V5YyYVrxOWTeh+IvPO+mZh0T7NbRQiRVYrHIzxqR1md3v67GXbKIONCNnrIt44sS70UNyMVF6FFRpWWLad6g/QgsQ7fDyTfVrq54l8V6PTjNhkpZ2vv7sQY5TuankQBhd2vuXBx1ffJ69tKTRBbXBZGoudMAdxRydJMHZtol6XjsO4zFdaBk8NABOZSq5UgrZwrNkkvu7LaBmYY55cjg15r6axBlSn3mFLcz+rlCpo9g81NLUWCFKzr3SFa8ClXwdC2JGigg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d2566e-9b40-4a36-c198-08d72d4a4b8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 13:02:21.3635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B9F6xH0vAkLt4CuuKo+tjXxPJLoNUaT75Zup/d7Hb3as25ghkEeety1PoH/EPZKOeNiWP2qUh7sF9xz6MBYE0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3949
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oclJXIOFCA7N1X92hPFFvGZuduprv++sGLfFVOf2axM=;
 b=RwpA89Jq8nIMYm9P4HwqryTdLcbA3EfnZDUEpTxpHkdavlEzowy65vTWvOs/6cdZOn5aFNi2MPX6ljK9gxywJPr44wHJ76CDwNuW0aECe5l1B1cqghKZzBy110NZ0ZRKuV73TicgI5Tq0wcRt+5vH4e5mSoO9H0rdVJT6fzOT5I=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Liu,
 Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+CgotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQpGcm9tOiBBYXJvbiBMaXUgPGFhcm9uLmxpdUBhbWQuY29tPiAKU2VudDogVGh1
cnNkYXksIEF1Z3VzdCAyOSwgMjAxOSAxMDoxMCBQTQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNv
bT47IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgTGl1LCBBYXJvbiA8QWFyb24uTGl1
QGFtZC5jb20+ClN1YmplY3Q6IFtQQVRDSCBWMl0gZHJtL2FtZC9wb3dlcnBsYXk6IFNNVV9NU0df
T3ZlcnJpZGVQY2llUGFyYW1ldGVycyBpcyB1bnN1cHBvcnQgZm9yIEFQVQoKRm9yIGFwdSwgU01V
X01TR19PdmVycmlkZVBjaWVQYXJhbWV0ZXJzIGlzIHVuc3VwcG9ydC4KU28gcmV0dXJuIGRpcmVj
dGx5IGluIHNtdV9vdmVycmlkZV9wY2llX3BhcmFtZXRlcnMgZnVuY3Rpb24uCgpTaWduZWQtb2Zm
LWJ5OiBBYXJvbiBMaXUgPGFhcm9uLmxpdUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1k
Z3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmlu
ZGV4IDhjNjE3NzguLmI3MjY1NjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9h
bWRncHVfc211LmMKQEAgLTEwMDEsNiArMTAwMSw5IEBAIHN0YXRpYyBpbnQgc211X292ZXJyaWRl
X3BjaWVfcGFyYW1ldGVycyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIAl1aW50MzJfdCBwY2ll
X2dlbiA9IDAsIHBjaWVfd2lkdGggPSAwLCBzbXVfcGNpZV9hcmc7CiAJaW50IHJldDsKIAorCWlm
IChhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpCisJCXJldHVybiAwOworCiAJaWYgKGFkZXYtPnBt
LnBjaWVfZ2VuX21hc2sgJiBDQUlMX1BDSUVfTElOS19TUEVFRF9TVVBQT1JUX0dFTjQpCiAJCXBj
aWVfZ2VuID0gMzsKIAllbHNlIGlmIChhZGV2LT5wbS5wY2llX2dlbl9tYXNrICYgQ0FJTF9QQ0lF
X0xJTktfU1BFRURfU1VQUE9SVF9HRU4zKQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
