Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73477533E
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 17:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F876E77B;
	Thu, 25 Jul 2019 15:52:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780053.outbound.protection.outlook.com [40.107.78.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF646E77B
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 15:52:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lhpd5XHE3ynbFFSAiVAm4jdj4G+LNICMFbvXPLVoY5/7lqqLHbO8m+8ypJaAEleQq0GabOmJY7UdOBtj6vxc/XnK6SgrHJJawk55a8CUE63tHjuNRSmUJX2GKchWLQDUIpePXlVWFOWLI1FrlO69nefEX9xDfJ28VUgyR/vcw+MaaYdfKsE1w97j2g8dMUOgyDyNyTjs8Y4amQ8BnXcsTAqFS+MBgwC/lfiw6U5Og4r251dBxhStiCAnrcC52gKZBZXfYgMvLjj3+2OpFRl3YA0NyUkSAsZLxb0kGo8rNMG9KcGHo9tI8DbUAUcHm86bA+YGH8sW2msbbX32NL6rWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n87ssFE0pDq1fH1+NmOzUVmbYDj1vUrCeYpmctJmfGc=;
 b=juaUeOT/2CGVsGreeq8ik55Cj9ZvmVdU0ENAUGIwJJYV7ejjpI1iUyy9z5BlwAlqN+V2MYBgszQlyefceLmnJkZT1jxBf/ip2RTUjdR56mDpre0qaCGozKAKAzGrNVQdEa/FISGDZAt8NNG6HLTem2G3GXwq3lysML8ajMdWgmk+KKxS+m2f5Y7GxaLk6PgLIcJCY2KoOTYkdALI46/QQSCDHmchC4AUwTMs9aYw87v/WbRJ8Rj7BvKOJyjvi2DqdNy41Fl5CpL6aIJmIQXfoaH0DBT1trk8pJa8EHi2NzbowmRUE0f5i3SYYOWtJBwVIp2o4obOA6tUEPfGXcfsdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR1201MB0178.namprd12.prod.outlook.com (10.174.114.148) by
 BN6PR1201MB0180.namprd12.prod.outlook.com (10.174.115.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 15:52:34 +0000
Received: from BN6PR1201MB0178.namprd12.prod.outlook.com
 ([fe80::e14e:201c:e206:9346]) by BN6PR1201MB0178.namprd12.prod.outlook.com
 ([fe80::e14e:201c:e206:9346%7]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 15:52:34 +0000
From: "Thai, Thong" <Thong.Thai@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/amdgpu/vcn_v2_0: Move VCN 2.0 specific dec ring
 test to vcn_v2_0
Thread-Topic: [PATCH 2/2] drm/amd/amdgpu/vcn_v2_0: Move VCN 2.0 specific dec
 ring test to vcn_v2_0
Thread-Index: AQHVQwD5oZSbYJmB60Se1qH/rQsSUg==
Date: Thu, 25 Jul 2019 15:52:34 +0000
Message-ID: <20190725155204.5739-2-thong.thai@amd.com>
References: <20190725155204.5739-1-thong.thai@amd.com>
In-Reply-To: <20190725155204.5739-1-thong.thai@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::44) To BN6PR1201MB0178.namprd12.prod.outlook.com
 (2603:10b6:405:55::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee4851fa-0633-48ed-5fc5-08d711181bee
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR1201MB0180; 
x-ms-traffictypediagnostic: BN6PR1201MB0180:
x-microsoft-antispam-prvs: <BN6PR1201MB0180FEE2819A1F97C1304F979DC10@BN6PR1201MB0180.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:193;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(199004)(189003)(66556008)(81156014)(81166006)(66946007)(50226002)(66446008)(5660300002)(66476007)(14454004)(4326008)(8676002)(3846002)(71200400001)(64756008)(68736007)(71190400001)(53936002)(8936002)(6486002)(305945005)(86362001)(102836004)(2906002)(316002)(66066001)(7736002)(386003)(36756003)(478600001)(6436002)(6506007)(5640700003)(6512007)(256004)(76176011)(446003)(486006)(1076003)(14444005)(25786009)(99286004)(11346002)(6916009)(52116002)(2616005)(186003)(2351001)(6116002)(476003)(26005)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0180;
 H:BN6PR1201MB0178.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: M1by7y7HIK0jhDT+Ro4zo+o2JE3w3X5rSRLnWjq9rfptLY6O3ZIgmzRkF0hNZ70CrG6D8rPa7ra0bSO/E7K1uyIRvhK4uiBxjApcMvBxJt6Ctr3L/+KeGw8ZnA8YXGoFrvtAKIddw9H2wOyqFnIKuF8qZY89vgkN0y5A/bxSx4xFOwRKdxLzLZo6funhp3P6WIijmvgML55X7X3dDZEDRwtVSaPXl8jctuN4ncg5YKCHNZ5IdHDm7jr3xEnVKBkxovo2UPxV5psRLPXQfjhSTNkKsXFiFgxtKMa4L4V+N9fnm1CFzajVoyWuNQeRlY2fPt63MfoARbFIYoYlDkl8qKgS2Mt0cxQqklCUaXyxjs87XvvN8hjKa+txY13lkik+IWkcJaHfXQDAcycN7LTArEoMcgGEuqw7+WwbnttRmg4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4851fa-0633-48ed-5fc5-08d711181bee
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 15:52:34.3487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thonthai@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n87ssFE0pDq1fH1+NmOzUVmbYDj1vUrCeYpmctJmfGc=;
 b=s1Q2dkccC/DIl+Q5MCFFCVT6w2lrrd9EttnSfZn1cryb23AHsBLpfw5ykhC7ocq5pXL1WoYkRsmRo6O6JL3Y1X5m8VA71dKFcraKlGj5cxQpYA8zidTUGJsuHtjXXnoOY94fyiyPxYLD2Tuu3BVlXBSHYkjqxyxm0HSw3pV1LcI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Thong.Thai@amd.com; 
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
Cc: "Thai, Thong" <Thong.Thai@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VkNOIDIuMCBmaXJtd2FyZSBub3cgcmVxdWlyZXMgYSBwYWNrZXQgc3RhcnQgY29tbWFuZCB0byBi
ZSBzZW50IGJlZm9yZQphbnkgb3RoZXIgZGVjb2RlIHJpbmcgYnVmZmVyIGNvbW1hbmQuCgpTaWdu
ZWQtb2ZmLWJ5OiBUaG9uZyBUaGFpIDx0aG9uZy50aGFpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYyB8IDMyICsrKysrKysrKysrKysrKysrKysrKysr
KysrLQogMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYwppbmRleCA3MDkxYWVmOTVmZjAuLjRiMDA0
ODFjZjllMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCkBAIC0yMDgyLDYg
KzIwODIsMzYgQEAgc3RhdGljIGludCB2Y25fdjJfMF9wcm9jZXNzX2ludGVycnVwdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKIAlyZXR1cm4gMDsKIH0KIAoraW50IHZjbl92Ml8wX2RlY19y
aW5nX3Rlc3RfcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCit7CisJc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYgPSByaW5nLT5hZGV2OworCXVpbnQzMl90IHRtcCA9IDA7CisJdW5zaWdu
ZWQgaTsKKwlpbnQgcjsKKworCVdSRUczMihhZGV2LT52Y24uZXh0ZXJuYWwuc2NyYXRjaDksIDB4
Q0FGRURFQUQpOworCXIgPSBhbWRncHVfcmluZ19hbGxvYyhyaW5nLCAzKTsKKwlpZiAocikKKwkJ
cmV0dXJuIHI7CisJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgUEFDS0VUMChhZGV2LT52Y24uaW50
ZXJuYWwuY21kLCAwKSk7CisJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgVkNOX0RFQ19LTURfQ01E
IHwgKFZDTl9ERUNfQ01EX1BBQ0tFVF9TVEFSVCA8PCAxKSk7CisJYW1kZ3B1X3Jpbmdfd3JpdGUo
cmluZywgUEFDS0VUMChhZGV2LT52Y24uaW50ZXJuYWwuc2NyYXRjaDksIDApKTsKKwlhbWRncHVf
cmluZ193cml0ZShyaW5nLCAweERFQURCRUVGKTsKKwlhbWRncHVfcmluZ19jb21taXQocmluZyk7
CisJZm9yIChpID0gMDsgaSA8IGFkZXYtPnVzZWNfdGltZW91dDsgaSsrKSB7CisJCXRtcCA9IFJS
RUczMihhZGV2LT52Y24uZXh0ZXJuYWwuc2NyYXRjaDkpOworCQlpZiAodG1wID09IDB4REVBREJF
RUYpCisJCQlicmVhazsKKwkJRFJNX1VERUxBWSgxKTsKKwl9CisKKwlpZiAoaSA+PSBhZGV2LT51
c2VjX3RpbWVvdXQpCisJCXIgPSAtRVRJTUVET1VUOworCisJcmV0dXJuIHI7Cit9CisKKwogc3Rh
dGljIGludCB2Y25fdjJfMF9zZXRfcG93ZXJnYXRpbmdfc3RhdGUodm9pZCAqaGFuZGxlLAogCQkJ
CQkgIGVudW0gYW1kX3Bvd2VyZ2F0aW5nX3N0YXRlIHN0YXRlKQogewpAQCAtMjE0NSw3ICsyMTc1
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfcmluZ19mdW5jcyB2Y25fdjJfMF9kZWNf
cmluZ192bV9mdW5jcyA9IHsKIAkuZW1pdF9pYiA9IHZjbl92Ml8wX2RlY19yaW5nX2VtaXRfaWIs
CiAJLmVtaXRfZmVuY2UgPSB2Y25fdjJfMF9kZWNfcmluZ19lbWl0X2ZlbmNlLAogCS5lbWl0X3Zt
X2ZsdXNoID0gdmNuX3YyXzBfZGVjX3JpbmdfZW1pdF92bV9mbHVzaCwKLQkudGVzdF9yaW5nID0g
YW1kZ3B1X3Zjbl9kZWNfcmluZ190ZXN0X3JpbmcsCisJLnRlc3RfcmluZyA9IHZjbl92Ml8wX2Rl
Y19yaW5nX3Rlc3RfcmluZywKIAkudGVzdF9pYiA9IGFtZGdwdV92Y25fZGVjX3JpbmdfdGVzdF9p
YiwKIAkuaW5zZXJ0X25vcCA9IHZjbl92Ml8wX2RlY19yaW5nX2luc2VydF9ub3AsCiAJLmluc2Vy
dF9zdGFydCA9IHZjbl92Ml8wX2RlY19yaW5nX2luc2VydF9zdGFydCwKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
