Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BA0A8626
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 17:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA5489BF6;
	Wed,  4 Sep 2019 15:48:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810071.outbound.protection.outlook.com [40.107.81.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9ACA89BF1
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 15:48:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxZXEQ4kE5iNWBx9WBLn+TWuvVpInuwm4egPN1J+M1j1GFovXLfh6BEdxYfkwOy2feGpa0qSHFGaPX0J1wv4ApmUzemKTis6Z9D9QvslZ73GlKTOV1GNReCVhO1v3uMWXjlgMmk4QasH6e19Skh9NJlgoJFY6qdnDjK3E4wvArdYRZNHRoaFIZDYko3Zk0BBGWBgx/WL9JSk+24NvUumth4aGxWn/WWQjJKQuivBbVQ3J9uVhgc/n1CJj3mc7d4IrjaUwMmlCO5yxje5lSCayboQS3R0O65I98WtBaqG86Zx76d/MFoQkxPnUUpp8G75GeoDFVf3V6mEBS2Vos5+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nExLMPRdK2SiLy0EbzwDCxkCIqrdk7oqA3zMBSm40WE=;
 b=hheOaKDk67ScE5QEpxRmXM6ddNNBVeIzpdhkFC4zH3lIOLHnJsKz3HpPjLD11cv0HMAD6dvVjsn2FxX+zc2MyTHb2W9oXfE59G8DsJ1NDZqyRDBYa4Q64dMuYAQs6SOYTEqv62Uax5HUzIKph9rvAhigqkWryVkGFBZae5AjiNdUxJUa9gVIE/OMyy1GUQ+JtXsJO6I+JT+DOCE1unSyJJTGL9BnRddSSs1LOhD+9LRCm71zxtXZeRQF9Zz+DITDBK44QdtD1hGlnbVnd4gI0vCeAxb0pk6UXwF5czyw6AwQmztsel7gLxFv7McwCCOVkKjiCIpHi/jq+PxC/0VaqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB2863.namprd12.prod.outlook.com (20.179.82.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 15:48:26 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 15:48:26 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/10] drm/amdkfd: add renoir kfd device info
Thread-Topic: [PATCH 02/10] drm/amdkfd: add renoir kfd device info
Thread-Index: AQHVYzgw4ROcrLJLOUmkYVYz93hV2w==
Date: Wed, 4 Sep 2019 15:48:26 +0000
Message-ID: <20190904154803.5102-3-ray.huang@amd.com>
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
x-ms-office365-filtering-correlation-id: 0e6746a1-b178-4521-7895-08d7314f533f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2863; 
x-ms-traffictypediagnostic: MN2PR12MB2863:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB286361D3EF312F2E6AE7A245ECB80@MN2PR12MB2863.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:459;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(66446008)(99286004)(64756008)(305945005)(66556008)(66476007)(66946007)(6436002)(5640700003)(86362001)(7736002)(3846002)(6116002)(486006)(256004)(6916009)(5660300002)(8676002)(2351001)(4326008)(6506007)(386003)(14454004)(316002)(54906003)(6486002)(11346002)(76176011)(478600001)(446003)(53936002)(52116002)(26005)(71190400001)(71200400001)(102836004)(66066001)(1076003)(186003)(36756003)(8936002)(25786009)(50226002)(81156014)(2501003)(81166006)(6512007)(2616005)(476003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2863;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: h9BBfx4iq3CrNL/2QMAn7RoUM/hv6i2nvteLvJRcWVXNmIC+t8oRiU0pRK31hZX1vJuBgH/lp1ATebg6V2a6K/h1fvF/VF77n/JVwSd9iC1u1KnczdoHhv1cFnfpzJJDDnJ2xYkwaUu4IQ2wZehHr9c9jo9vCxQK1LbOenvP54Gmn0FsUrFGeg2sodS3YJ2ZBcQPduXELTy9c9sIb/9curEPWtBA85gNkDYW4UV0JyFqmnIziawojpU95wASpG7JTcyyrQx1uG885HiN9X9+7YmyXksEGHlM2tW/C/bVb4dC38UmoKaZlwLJ2HMxjR9a19FWZdATmm1CBIao+/pUYcfvnbVWKGTE+9GODzWaiHS/2IcYa5jlcVd4JaZ/UB9jRC5CrAZ3IirAupfa8lIoPg47v6NbF7KlZj0renOb5vE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6746a1-b178-4521-7895-08d7314f533f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 15:48:26.7349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mu1RPBge5oY0Xqd3xVHTvjZ3Ns8rklWIp32ldfQ3ccMF1tKRxEN9wOQrXr0TVco6dQx/tH8AsZo+yh6t5BJ0Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2863
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nExLMPRdK2SiLy0EbzwDCxkCIqrdk7oqA3zMBSm40WE=;
 b=ZiZaIhUBVESjXKoz7wouEQMXyG61XsOKLbW/IkIxikUjYVhTSRbRwUpRN9uZQ2N4gUvHNxH779jrlaXXcbXpIdwKWy6lnJjkbeJ78ef4od/N9L3kKimXHaGZLQRgaZCDtrJWBC6M1dvXanjcSkqar+tG3hEv4PrEQhkzE2ddkPs=
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

VGhpcyBwYXRjaCBpbml0cyByZW5vaXIga2ZkIGRldmljZSBpbmZvLCBzbyB3ZSB0cmVhdCByZW5v
aXIgYXMgImRncHUiCihieXBhc3MgaW9tbXUgdjIpLiBXaWxsIGVuYWJsZSBuZWVkc19pb21tdV9k
ZXZpY2UgdGlsbCByZW5vaXIgaW9tbXUgaXMgcmVhZHkuCgpTaWduZWQtb2ZmLWJ5OiBIdWFuZyBS
dWkgPHJheS5odWFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9kZXZpY2UuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCmluZGV4
IDI1MTQyNjMuLjFmNjU1ODUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNl
LmMKQEAgLTMxNyw2ICszMTcsMjMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBrZmRfZGV2aWNlX2lu
Zm8gdmVnYTIwX2RldmljZV9pbmZvID0gewogCS5udW1fc2RtYV9xdWV1ZXNfcGVyX2VuZ2luZSA9
IDgsCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyByZW5vaXJfZGV2
aWNlX2luZm8gPSB7CisJLmFzaWNfZmFtaWx5ID0gQ0hJUF9SRU5PSVIsCisJLm1heF9wYXNpZF9i
aXRzID0gMTYsCisJLm1heF9ub19vZl9ocWQgID0gMjQsCisJLmRvb3JiZWxsX3NpemUgID0gOCwK
KwkuaWhfcmluZ19lbnRyeV9zaXplID0gOCAqIHNpemVvZih1aW50MzJfdCksCisJLmV2ZW50X2lu
dGVycnVwdF9jbGFzcyA9ICZldmVudF9pbnRlcnJ1cHRfY2xhc3NfdjksCisJLm51bV9vZl93YXRj
aF9wb2ludHMgPSA0LAorCS5tcWRfc2l6ZV9hbGlnbmVkID0gTVFEX1NJWkVfQUxJR05FRCwKKwku
c3VwcG9ydHNfY3dzciA9IHRydWUsCisJLm5lZWRzX2lvbW11X2RldmljZSA9IGZhbHNlLAorCS5u
ZWVkc19wY2lfYXRvbWljcyA9IGZhbHNlLAorCS5udW1fc2RtYV9lbmdpbmVzID0gMSwKKwkubnVt
X3hnbWlfc2RtYV9lbmdpbmVzID0gMCwKKwkubnVtX3NkbWFfcXVldWVzX3Blcl9lbmdpbmUgPSAy
LAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBrZmRfZGV2aWNlX2luZm8gbmF2aTEwX2Rldmlj
ZV9pbmZvID0gewogCS5hc2ljX2ZhbWlseSA9IENISVBfTkFWSTEwLAogCS5tYXhfcGFzaWRfYml0
cyA9IDE2LApAQCAtNDUyLDYgKzQ2OSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2Rldmlj
ZWlkIHN1cHBvcnRlZF9kZXZpY2VzW10gPSB7CiAJeyAweDY2YTQsICZ2ZWdhMjBfZGV2aWNlX2lu
Zm8gfSwJLyogVmVnYTIwICovCiAJeyAweDY2YTcsICZ2ZWdhMjBfZGV2aWNlX2luZm8gfSwJLyog
VmVnYTIwICovCiAJeyAweDY2YWYsICZ2ZWdhMjBfZGV2aWNlX2luZm8gfSwJLyogVmVnYTIwICov
CisJLyogUmVub2lyICovCisJeyAweDE2MzYsICZyZW5vaXJfZGV2aWNlX2luZm8gfSwJLyogUmVu
b2lyICovCiAJLyogTmF2aTEwICovCiAJeyAweDczMTAsICZuYXZpMTBfZGV2aWNlX2luZm8gfSwJ
LyogTmF2aTEwICovCiAJeyAweDczMTIsICZuYXZpMTBfZGV2aWNlX2luZm8gfSwJLyogTmF2aTEw
ICovCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
