Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92737756A9
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 20:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB9A6E819;
	Thu, 25 Jul 2019 18:15:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770072.outbound.protection.outlook.com [40.107.77.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1656E812
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 18:15:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBApyPWdLFcyAkYfCHFBoLIZi3OU2LiZN5KTcvUIsAEUaEO40h6aXLcrHybbtcvMUq+BuEcwHQIbzFq6Pk/2x13xoAmbgBoz+9mxr9XN5ip1h+iroi5hQocJxiizIXP1+aXRrh75ivZtJje/UXholcFaYqp0L222C7W6WBTY0LqN23lZo4nXyY/lqG9va7Wl0MHArHNjKbIgByc1mzqBGThfwXlcGEy7AZ69kRzepY9WPGTFerhz7crIl9GpWPzDpakNVIRM2zvN2HN1dugKHfRiAmZt1swd4Hu0LTlw5dnW0LkW5EXIwkHQB1+tJb9XTyU/+PlaDAwIL4BqL3h4Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ck9k9xXGQTJYjdfqRizckjS4glm5KeLyx1ToUMiC8Es=;
 b=WyWlmZKOFqYhPZDaQDcug8I8rMjQ0/39EbmkMcqBBEBa7ByM99YHxJdXqDy9l8dJddqQDAxA8plNyhlD325HMvDJbtfbS+2McJ9V61Zm/p9nYsCOCblT6GGgD1MM5nVUGjWY/SruvJRW97CS9lSbGY1jimYg8Qb6Fwu/vtfuYkT23BfqJNdBZtkkWd+kD7Lv7QYaGMnG8L9/bRlfAk5yt6DOZSSMsuz470NMr/4k5UunQ1AhTXqEo2151Aei3Hp80YG0Ld4iqIxN9h5Sggggt/c3swEzq803wbNJXPDY511461tVGl9hkFaTK9EqCg892b84M2F/T+DuFrBBOGp+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR1201MB0178.namprd12.prod.outlook.com (10.174.114.148) by
 BN6PR1201MB0163.namprd12.prod.outlook.com (10.174.115.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.15; Thu, 25 Jul 2019 18:15:43 +0000
Received: from BN6PR1201MB0178.namprd12.prod.outlook.com
 ([fe80::e14e:201c:e206:9346]) by BN6PR1201MB0178.namprd12.prod.outlook.com
 ([fe80::e14e:201c:e206:9346%7]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 18:15:43 +0000
From: "Thai, Thong" <Thong.Thai@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 2/2] drm/amd/amdgpu/vcn_v2_0: Move VCN 2.0 specific dec
 ring test to vcn_v2_0
Thread-Topic: [PATCH v3 2/2] drm/amd/amdgpu/vcn_v2_0: Move VCN 2.0 specific
 dec ring test to vcn_v2_0
Thread-Index: AQHVQxT4kn+UrrHMiUOdEUApGzOYuQ==
Date: Thu, 25 Jul 2019 18:15:42 +0000
Message-ID: <20190725181516.6114-2-thong.thai@amd.com>
References: <20190725181516.6114-1-thong.thai@amd.com>
In-Reply-To: <20190725181516.6114-1-thong.thai@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::48)
 To BN6PR1201MB0178.namprd12.prod.outlook.com
 (2603:10b6:405:55::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee7a9406-b32b-498d-a439-08d7112c1b1c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR1201MB0163; 
x-ms-traffictypediagnostic: BN6PR1201MB0163:
x-microsoft-antispam-prvs: <BN6PR1201MB016384E68B6D6EA6FB3A7C3C9DC10@BN6PR1201MB0163.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:193;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(199004)(189003)(14454004)(256004)(36756003)(6506007)(76176011)(386003)(71190400001)(5640700003)(68736007)(14444005)(305945005)(6486002)(53936002)(6916009)(2906002)(71200400001)(66446008)(66476007)(86362001)(81166006)(186003)(52116002)(476003)(102836004)(11346002)(26005)(8676002)(81156014)(446003)(5660300002)(3846002)(1076003)(6116002)(6512007)(2351001)(64756008)(2501003)(478600001)(99286004)(2616005)(316002)(4326008)(486006)(50226002)(8936002)(66946007)(66556008)(25786009)(6436002)(7736002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0163;
 H:BN6PR1201MB0178.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uXr/Pyz4dAxQRBkkyq+YKJqjMtrBaOYyEEf0tAOWb1I1SXJz3l9ADtis3L502lJ1boiJG/wt0fWjHdJSYsiEf7T8c/9X3mD81mTpaNUP3cznC7Q/cdrIge2mec6Blz2DZrFMhZnGJs3q5r+N3xRr8nekz/mIiyWLjAq7Idi/qa3CsbfPY6lUnt0RWmqkPpd96RuLHscQy9XbNW3Cag1TFtJXAv9q9OebJag+t+2WEKRlQ45IhJIYhSChowMH+ryagHsO00stDPfe4HDEU+WMkANWZLR5oLOJ2tDgLIrwRlBRJCBeLNhC+XWxlLdFukK2kIfMiKaALJxKAqfxHXSCPLYdj5KDTo7peo2nTCJ3++FhhwzoYKGj2QhdSZUREp+9sgXHWyghrbUcE4pbW+PO1ku40nRSQmHkvplf8nLZpyk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7a9406-b32b-498d-a439-08d7112c1b1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 18:15:42.9408 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thonthai@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0163
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ck9k9xXGQTJYjdfqRizckjS4glm5KeLyx1ToUMiC8Es=;
 b=P9eeewYM8dW19aodC90x9FsYWg72Oc8HIoZEbw0+XUrb1j63KSI01tsPYIacoqA2LLBjwBJx0yx7HCKnWfjbThXTpQhXg8B0wZJsdCc86ZEuMAIeGOqKAegMrxKSeHOUo+5xImct8UYBW+EuTtLGLnijUIUg89id/mHDcYtIBvY=
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYwppbmRleCA3MDkxYWVmOTVmZjAuLmRlOTI4
ZjFiMTUyOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCkBAIC0yMDgyLDYg
KzIwODIsMzYgQEAgc3RhdGljIGludCB2Y25fdjJfMF9wcm9jZXNzX2ludGVycnVwdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKIAlyZXR1cm4gMDsKIH0KIAoraW50IHZjbl92Ml8wX2RlY19y
aW5nX3Rlc3RfcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCit7CisJc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYgPSByaW5nLT5hZGV2OworCXVpbnQzMl90IHRtcCA9IDA7CisJdW5zaWdu
ZWQgaTsKKwlpbnQgcjsKKworCVdSRUczMihhZGV2LT52Y24uZXh0ZXJuYWwuc2NyYXRjaDksIDB4
Q0FGRURFQUQpOworCXIgPSBhbWRncHVfcmluZ19hbGxvYyhyaW5nLCA0KTsKKwlpZiAocikKKwkJ
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
