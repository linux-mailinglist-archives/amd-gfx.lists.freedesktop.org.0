Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB74B4741
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 08:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785B06E143;
	Tue, 17 Sep 2019 06:17:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770081.outbound.protection.outlook.com [40.107.77.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04766E143
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 06:17:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUwZOB24gK0Id/edZuF1bxAQ4xZiaQbHjVoXopxYooA42wQ0kCeUyVFU2RzsdrP4f9ZO/8bTFX7+NiS/wIFmDYmFb2JJhLj4SeMNtpIcrA2UL81qSHV2jcL4ac/gzawr5VO/QRKcGuMiJNOugwrRjk6QQOdJI2C8Rs84X2VuS/3QKu5rWU6mcbzNjPK9Ew0Z0pSwhuy0yHytyWFUSOQllam1faepjV7jQUhXd15Enmfp8nS6MeeD17sQhP4dOzvt5sfbVRSDioIlg81lMM9Va49qRbJVsKJ2xWIjWtBesiGjT9JQUXSU78jg1stEqsNviXm1R0TWuqIk14LgiQzcRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjGWIDAxzz/MFBLX7luScwg+UC1e0n67Ytwh1+yp+4U=;
 b=E1VY75vJbwm4pMCy/w5aaqj82DWa2JjzuE0NJezOQwKOx58qpI2TcGtvaCyQeKz4ULu9f3cnJhh+VKdgbQ44oU8XCPODNkc9tlJ2yv0R6Bewr6MufOAVz7sqqKBeezW0D2RIJY5ZL/xBAAjlKhpx5Xp45CfEVclIvGxhE06Zy6f2E4X14Wp8t95nX4XgvFsN6C37sJRcZO6Bj9u8GgvESz+bl7QK5JFrc81CipLpqCpABbwd81Y4foYl4PNcD59+Nuu/Uk87WfgGfJMeKqeso23QusJpu7IEcuFpdl+EDNDyGR4W58C4z/NBvtZ4LbpwChwPh6s2+hi1ovBB8SoTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3440.namprd12.prod.outlook.com (20.178.244.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Tue, 17 Sep 2019 06:16:59 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 06:16:59 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 1/2] drm/amdgpu: initialize bo in ras_reserve_bad_pages
Thread-Topic: [PATCH 1/2] drm/amdgpu: initialize bo in ras_reserve_bad_pages
Thread-Index: AQHVbR+D232EkzjzkkamUHIgttfWPg==
Date: Tue, 17 Sep 2019 06:16:59 +0000
Message-ID: <20190917061643.29367-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0149.apcprd02.prod.outlook.com
 (2603:1096:202:16::33) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8aeb9e9-6821-4dad-6340-08d73b36a568
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3440; 
x-ms-traffictypediagnostic: MN2PR12MB3440:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB34403276D31BA67F2E1E3AB7B08F0@MN2PR12MB3440.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(199004)(189003)(66946007)(66446008)(186003)(64756008)(66556008)(66476007)(99286004)(26005)(102836004)(66066001)(52116002)(6636002)(2616005)(476003)(386003)(6506007)(2501003)(6436002)(486006)(50226002)(36756003)(6486002)(6512007)(4326008)(110136005)(478600001)(25786009)(81156014)(8676002)(81166006)(8936002)(3846002)(1076003)(256004)(4744005)(6116002)(86362001)(7736002)(2906002)(14454004)(316002)(71190400001)(305945005)(5660300002)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3440;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /EIQe8TlTHKugpaPQv8fY4SxBtoqDRXFnIYo/jqlRQ3LnYCH1PbXLs7HMUul8K6rilok1057N6aNOWjQVYZyhbp9skzrGbO61Zt+F1KGpLyGW1Up+1hNgnUkmlCsjC2zWyLdh9/87b7cUwFzmdXLHkcvVUDq0Rr8RHAVcesp+M7nqKCjC1Lpv6KxhF05EMShIEdW9vss+TsyfCCLTYsViPbzpM7pc57bFPmojZO5sJtA8BsUPRSZy7lCLzXcFCHUgbuqnW157NDIlBSTiFoo5gF7XbiYdlJiRN8aKlROn/kKZB9ZgzwNJ6vAOvFx3I1kqR/tJdwFsBilOu4X8j8N0bhIA88CqKTp38h7nY0CdeU4Hc9BawtDShhcZQ5nnpnRBp+HI+zbdPTlrb0ICsJMEzznz9vQSQiH4l5KYcsHP3A=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8aeb9e9-6821-4dad-6340-08d73b36a568
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 06:16:59.0966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jx0zRWROUSc/EMYSBnDf/t2JHOOwK82Kwa+SyOnxRtupctqoFZLJ0fQqK+XDKvTM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3440
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjGWIDAxzz/MFBLX7luScwg+UC1e0n67Ytwh1+yp+4U=;
 b=pNgdyX982s508RGz+N1prxh8GnL+G7E8/NRmnjlAgKOOaykWwrHvQvG2lv0l1z4dmVmz2ACJlW1NUR9Q2gI/8AJz8L6NBXogJcUMx00SuLIoe5lY0mdpC1clJr2P19zIFMImq4tb/KW248Vrgwydku+Pz0MnFojghaIzfcm60sg=
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

dGhlIGJvIHBvaW50ZXIgaXMgcmV1c2VkIGZvciBiYWQgcGFnZXMsIGluaXRpYWxpemUgaXQgaW4g
ZWFjaCBsb29wCgpTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmFzLmMKaW5kZXggNWY2MjNkYWY1MDc4Li4wOTBkYWY1OTU0NjkgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKQEAgLTE0MjEsNiArMTQyMSw3IEBAIGludCBhbWRncHVf
cmFzX3Jlc2VydmVfYmFkX3BhZ2VzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCiAJCWRh
dGEtPmJwc19ib1tpXSA9IGJvOwogCQlkYXRhLT5sYXN0X3Jlc2VydmVkID0gaSArIDE7CisJCWJv
ID0gTlVMTDsKIAl9CiAKIAkvKiBjb250aW51ZSB0byBzYXZlIGJhZCBwYWdlcyB0byBlZXByb20g
ZXZlbiByZWVzcnZlX3ZyYW0gZmFpbHMgKi8KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
