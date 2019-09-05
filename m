Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 081EDA992A
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 06:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0777289B61;
	Thu,  5 Sep 2019 04:03:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730059.outbound.protection.outlook.com [40.107.73.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E1989B61
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 04:03:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9YZVgLUpaV7CMaxUVDQqWN6TgLcd3h+lVzxKUZvzvXgzRHweXahKgNbg1AbVUfF7T01g+h0PUCGB7xCZoTUGzwOiOwM2/q0rAM8i/xy/MM/MGGxu31Ek8iO6XREwfFbsa6Ea2TL21TAaqz5Kcw2X/lp46hffmtA5iMhxS6RPJS7B2HHyv91xlxwzoB/nWYiPrkT0Jwa4/lPfRlJaUY84YVMbv0Z5ifsXZBSLn042Ob7Fyu4I5iSqk+qGoLoefVXCq+kaV6hM55WsRSBcgsKnBJOi5DIiphIewJWmNhveLN9nhvqt0SSHiTbX1fBoI7yXatvaLP8AEvj7bKVQqYwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1H/dZsCTxoznayz2bcfHzlKJyC3btXAoCzSD11uvao=;
 b=QUz89F2+QzsU2LIV7vLp/V2moMt5JFlhickUN2mv2J21cl9/aRX1EnYeOBWeQhTOvwYC8NpYSiDL7IzVHrnuwO/0SH+2SGkhDqpB/AvIzIoed0ybLL03ITX8hRzu26V0wcKCfh5bdqYn1LxruciRWuAjoHfGKH0TvgBsCL/OxmMIINIYU5JkluGL5NoXztx8A8NPHEP8cvlbLOaWsUOkU+ORpNpxBx0VsouHfmJJnsMd77wiB/g5n1Kt77neEXzRzkybQPemmq72i40963LD1IGuV5UIY67L6tnTwpl9ZroEwb57lGA4vi3vKD2g/OpkuIq5dl+2qXPtFm1xLl2vEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3807.namprd12.prod.outlook.com (10.255.237.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Thu, 5 Sep 2019 04:03:46 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 04:03:46 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Chen, Guchun"
 <Guchun.Chen@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Clements, John" <John.Clements@amd.com>
Subject: [PATCH 1/4] drm/amdgpu: change ras bps type to eeprom table record
 structure
Thread-Topic: [PATCH 1/4] drm/amdgpu: change ras bps type to eeprom table
 record structure
Thread-Index: AQHVY57qPFMOLA7hKEixhaoygdCKiw==
Date: Thu, 5 Sep 2019 04:03:46 +0000
Message-ID: <20190905040324.18741-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0030.apcprd03.prod.outlook.com
 (2603:1096:203:2f::18) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56fd940a-eaaa-46c0-befb-08d731b60cab
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3807; 
x-ms-traffictypediagnostic: MN2PR12MB3807:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3807F049D31BF8970140F433B0BB0@MN2PR12MB3807.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(199004)(189003)(86362001)(36756003)(478600001)(6506007)(1076003)(50226002)(81156014)(386003)(6636002)(81166006)(8676002)(52116002)(8936002)(14454004)(66066001)(99286004)(5660300002)(186003)(486006)(25786009)(4326008)(476003)(2906002)(256004)(3846002)(2616005)(53936002)(6512007)(66556008)(2501003)(6436002)(26005)(14444005)(305945005)(316002)(71190400001)(71200400001)(6116002)(7736002)(102836004)(110136005)(66446008)(66476007)(64756008)(66946007)(6486002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3807;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Q4WSjZGW1oWuIFr5xQkfgEAJKfZSeW1ZLvSMTLwy/jOGD1YVMBauOb5tLBGeE5bCQ/wwPNRY808iCpWNTcfhZK3muf0Gw7JMc5/jmpaymHvl4k1dS7Dyit3XP3Ob64ZRmuF3HXRsCkPXUWZSRZmfMBzDf8MY3zVaViOHid6v4DI4KJ/1CjaqrVAxVogZQvCL3jbDE5tpF6K0C+m0yrWYTta9LcV41E4DaaxjqPcoNtPubzVhIyk9IIELvG+6vEtIqsAQ8mZWeXKd6aF8cCSSLoQGC7fFjwrkKezUGVcXZkVJ5O6O6z6rSLHibiX2ET61JyOG3rM/UQ7DAPZt20twzUzK3O7BfYZP7bMx5QL7iLMSXoUFFQdIODeuezoFM0pVPAqmBW8ZaJgqI/I56C/16xhXT3oF3au1ODyVeRTptcE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56fd940a-eaaa-46c0-befb-08d731b60cab
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 04:03:46.6213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iOFP6vHt9BcxMHXdWNwyPKcoNixFN5Drsk9CQYXmGEiCM3UqxTpuyE1jqpOa/Nni
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3807
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1H/dZsCTxoznayz2bcfHzlKJyC3btXAoCzSD11uvao=;
 b=nfmVdRtuT7vZ/VyXC6cB/skaK3ZR9XaZba7dkib4lsXCTPEjsooLKXlxfZBBZBQK9IOF/cDxZzWaT7TRQJojNbOVYkBtWcyce/3+IQN0bjrVA2AQYRVgjiNaQmCZjR7xCg5oSHIMpnB2Ddlnidy8KjcuYuBj1c+cH+dgA2AAgRk=
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

Y2hhbmdlIGJwcyB0eXBlIGZyb20gcmV0aXJlZCBwYWdlIHRvIGVlcHJvbSB0YWJsZSByZWNvcmQs
IHByZXBhcmUgZm9yCnNhdmluZyB1bWMgZXJyb3IgcmVjb3JkcyB0byBlZXByb20KClNpZ25lZC1v
ZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEd1Y2h1biBD
aGVuIDxndWNodW4uY2hlbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9yYXMuYyB8IDU5ICsrKysrKysrKysrKysrKystLS0tLS0tLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCB8IDExICsrKy0tCiAyIGZpbGVzIGNoYW5nZWQs
IDQzIGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuYwppbmRleCA1YzIyNzZiYjgzMjUuLmM2ZjRjMDFiOThhOCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwpAQCAtMTIwMywxNCArMTIwMywxNCBA
QCBzdGF0aWMgaW50IGFtZGdwdV9yYXNfYmFkcGFnZXNfcmVhZChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKIAogCWZvciAoOyBpIDwgZGF0YS0+Y291bnQ7IGkrKykgewogCQkoKmJwcylbaV0g
PSAoc3RydWN0IHJhc19iYWRwYWdlKXsKLQkJCS5icCA9IGRhdGEtPmJwc1tpXS5icCwKKwkJCS5i
cCA9IGRhdGEtPmJwc1tpXS5yZXRpcmVkX3BhZ2UsCiAJCQkuc2l6ZSA9IEFNREdQVV9HUFVfUEFH
RV9TSVpFLAogCQkJLmZsYWdzID0gMCwKIAkJfTsKIAogCQlpZiAoZGF0YS0+bGFzdF9yZXNlcnZl
ZCA8PSBpKQogCQkJKCpicHMpW2ldLmZsYWdzID0gMTsKLQkJZWxzZSBpZiAoZGF0YS0+YnBzW2ld
LmJvID09IE5VTEwpCisJCWVsc2UgaWYgKGRhdGEtPmJwc19ib1tpXSA9PSBOVUxMKQogCQkJKCpi
cHMpW2ldLmZsYWdzID0gMjsKIAl9CiAKQEAgLTEzMDQsMzAgKzEzMDQsNDAgQEAgc3RhdGljIGlu
dCBhbWRncHVfcmFzX3JlYWxsb2NfZWhfZGF0YV9zcGFjZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKIHsKIAl1bnNpZ25lZCBpbnQgb2xkX3NwYWNlID0gZGF0YS0+Y291bnQgKyBkYXRhLT5z
cGFjZV9sZWZ0OwogCXVuc2lnbmVkIGludCBuZXdfc3BhY2UgPSBvbGRfc3BhY2UgKyBwYWdlczsK
LQl1bnNpZ25lZCBpbnQgYWxpZ25fc3BhY2UgPSBBTElHTihuZXdfc3BhY2UsIDEwMjQpOwotCXZv
aWQgKnRtcCA9IGttYWxsb2MoYWxpZ25fc3BhY2UgKiBzaXplb2YoKmRhdGEtPmJwcyksIEdGUF9L
RVJORUwpOwotCi0JaWYgKCF0bXApCisJdW5zaWduZWQgaW50IGFsaWduX3NwYWNlID0gQUxJR04o
bmV3X3NwYWNlLCA1MTIpOworCXZvaWQgKmJwcyA9IGttYWxsb2MoYWxpZ25fc3BhY2UgKiBzaXpl
b2YoKmRhdGEtPmJwcyksIEdGUF9LRVJORUwpOworCXN0cnVjdCBhbWRncHVfYm8gKipicHNfYm8g
PQorCQkJa21hbGxvYyhhbGlnbl9zcGFjZSAqIHNpemVvZigqZGF0YS0+YnBzX2JvKSwgR0ZQX0tF
Uk5FTCk7CisKKwlpZiAoIWJwcyB8fCAhYnBzX2JvKSB7CisJCWtmcmVlKGJwcyk7CisJCWtmcmVl
KGJwc19ibyk7CiAJCXJldHVybiAtRU5PTUVNOworCX0KIAogCWlmIChkYXRhLT5icHMpIHsKLQkJ
bWVtY3B5KHRtcCwgZGF0YS0+YnBzLAorCQltZW1jcHkoYnBzLCBkYXRhLT5icHMsCiAJCQkJZGF0
YS0+Y291bnQgKiBzaXplb2YoKmRhdGEtPmJwcykpOwogCQlrZnJlZShkYXRhLT5icHMpOwogCX0K
KwlpZiAoZGF0YS0+YnBzX2JvKSB7CisJCW1lbWNweShicHNfYm8sIGRhdGEtPmJwc19ibywKKwkJ
CQlkYXRhLT5jb3VudCAqIHNpemVvZigqZGF0YS0+YnBzX2JvKSk7CisJCWtmcmVlKGRhdGEtPmJw
c19ibyk7CisJfQogCi0JZGF0YS0+YnBzID0gdG1wOworCWRhdGEtPmJwcyA9IGJwczsKKwlkYXRh
LT5icHNfYm8gPSBicHNfYm87CiAJZGF0YS0+c3BhY2VfbGVmdCArPSBhbGlnbl9zcGFjZSAtIG9s
ZF9zcGFjZTsKIAlyZXR1cm4gMDsKIH0KIAogLyogaXQgZGVhbCB3aXRoIHZyYW0gb25seS4gKi8K
IGludCBhbWRncHVfcmFzX2FkZF9iYWRfcGFnZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
Ci0JCXVuc2lnbmVkIGxvbmcgKmJwcywgaW50IHBhZ2VzKQorCQlzdHJ1Y3QgZWVwcm9tX3RhYmxl
X3JlY29yZCAqYnBzLCBpbnQgcGFnZXMpCiB7CiAJc3RydWN0IGFtZGdwdV9yYXMgKmNvbiA9IGFt
ZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldik7CiAJc3RydWN0IHJhc19lcnJfaGFuZGxlcl9kYXRh
ICpkYXRhOwotCWludCBpID0gcGFnZXM7CiAJaW50IHJldCA9IDA7CiAKIAlpZiAoIWNvbiB8fCAh
Y29uLT5laF9kYXRhIHx8ICFicHMgfHwgcGFnZXMgPD0gMCkKQEAgLTEzNDQsMTAgKzEzNTQsMTAg
QEAgaW50IGFtZGdwdV9yYXNfYWRkX2JhZF9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwKIAkJCWdvdG8gb3V0OwogCQl9CiAKLQl3aGlsZSAoaS0tKQotCQlkYXRhLT5icHNbZGF0YS0+
Y291bnQrK10uYnAgPSBicHNbaV07Ci0KKwltZW1jcHkoJmRhdGEtPmJwc1tkYXRhLT5jb3VudF0s
IGJwcywgcGFnZXMgKiBzaXplb2YoKmRhdGEtPmJwcykpOworCWRhdGEtPmNvdW50ICs9IHBhZ2Vz
OwogCWRhdGEtPnNwYWNlX2xlZnQgLT0gcGFnZXM7CisKIG91dDoKIAltdXRleF91bmxvY2soJmNv
bi0+cmVjb3ZlcnlfbG9jayk7CiAKQEAgLTEzNzIsMTMgKzEzODIsMTMgQEAgaW50IGFtZGdwdV9y
YXNfcmVzZXJ2ZV9iYWRfcGFnZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCWdvdG8g
b3V0OwogCS8qIHJlc2VydmUgdnJhbSBhdCBkcml2ZXIgcG9zdCBzdGFnZS4gKi8KIAlmb3IgKGkg
PSBkYXRhLT5sYXN0X3Jlc2VydmVkOyBpIDwgZGF0YS0+Y291bnQ7IGkrKykgewotCQlicCA9IGRh
dGEtPmJwc1tpXS5icDsKKwkJYnAgPSBkYXRhLT5icHNbaV0ucmV0aXJlZF9wYWdlOwogCiAJCWlm
IChhbWRncHVfcmFzX3Jlc2VydmVfdnJhbShhZGV2LCBicCA8PCBQQUdFX1NISUZULAogCQkJCQlQ
QUdFX1NJWkUsICZibykpCiAJCQlEUk1fRVJST1IoIlJBUyBFUlJPUjogcmVzZXJ2ZSB2cmFtICVs
bHggZmFpbFxuIiwgYnApOwogCi0JCWRhdGEtPmJwc1tpXS5ibyA9IGJvOworCQlkYXRhLT5icHNf
Ym9baV0gPSBibzsKIAkJZGF0YS0+bGFzdF9yZXNlcnZlZCA9IGkgKyAxOwogCX0KIG91dDoKQEAg
LTE0MDMsMTEgKzE0MTMsMTEgQEAgc3RhdGljIGludCBhbWRncHVfcmFzX3JlbGVhc2VfYmFkX3Bh
Z2VzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQlnb3RvIG91dDsKIAogCWZvciAoaSA9
IGRhdGEtPmxhc3RfcmVzZXJ2ZWQgLSAxOyBpID49IDA7IGktLSkgewotCQlibyA9IGRhdGEtPmJw
c1tpXS5ibzsKKwkJYm8gPSBkYXRhLT5icHNfYm9baV07CiAKIAkJYW1kZ3B1X3Jhc19yZWxlYXNl
X3ZyYW0oYWRldiwgJmJvKTsKIAotCQlkYXRhLT5icHNbaV0uYm8gPSBibzsKKwkJZGF0YS0+YnBz
X2JvW2ldID0gYm87CiAJCWRhdGEtPmxhc3RfcmVzZXJ2ZWQgPSBpOwogCX0KIG91dDoKQEAgLTE0
MjMsMTIgKzE0MzMsMTkgQEAgc3RhdGljIGludCBhbWRncHVfcmFzX3NhdmVfYmFkX3BhZ2VzKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXJldHVybiAwOwogfQogCisvKgorICogcmVhZCBl
cnJvciByZWNvcmQgYXJyYXkgaW4gZWVwcm9tIGFuZCByZXNlcnZlIGVub3VnaCBzcGFjZSBmb3IK
KyAqIHN0b3JpbmcgbmV3IGJhZCBwYWdlcworICovCiBzdGF0aWMgaW50IGFtZGdwdV9yYXNfbG9h
ZF9iYWRfcGFnZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7Ci0JLyogVE9ETwotCSAq
IHJlYWQgdGhlIGFycmF5IHRvIGVlcHJvbSB3aGVuIFNNVSBkaXNhYmxlZC4KLQkgKi8KLQlyZXR1
cm4gMDsKKwlzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCAqYnBzID0gTlVMTDsKKwlpbnQgcmV0
OworCisJcmV0ID0gYW1kZ3B1X3Jhc19hZGRfYmFkX3BhZ2VzKGFkZXYsIGJwcywKKwkJCQlhZGV2
LT51bWMubWF4X3Jhc19lcnJfY250X3Blcl9xdWVyeSk7CisKKwlyZXR1cm4gcmV0OwogfQogCiBz
dGF0aWMgaW50IGFtZGdwdV9yYXNfcmVjb3ZlcnlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
aCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAppbmRleCBmNDg3MDM4
YmEzMzEuLmJjMWQ0NTk3MTYwNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuaApAQCAtMzUxLDExICszNTEsMTAgQEAgc3RydWN0IHJhc19lcnJfZGF0YSB7CiB9OwogCiBz
dHJ1Y3QgcmFzX2Vycl9oYW5kbGVyX2RhdGEgewotCS8qIHBvaW50IHRvIGJhZCBwYWdlcyBhcnJh
eSAqLwotCXN0cnVjdCB7Ci0JCXVuc2lnbmVkIGxvbmcgYnA7Ci0JCXN0cnVjdCBhbWRncHVfYm8g
KmJvOwotCX0gKmJwczsKKwkvKiBwb2ludCB0byBiYWQgcGFnZSByZWNvcmRzIGFycmF5ICovCisJ
c3RydWN0IGVlcHJvbV90YWJsZV9yZWNvcmQgKmJwczsKKwkvKiBwb2ludCB0byByZXNlcnZlZCBi
byBhcnJheSAqLworCXN0cnVjdCBhbWRncHVfYm8gKipicHNfYm87CiAJLyogdGhlIGNvdW50IG9m
IGVudHJpZXMgKi8KIAlpbnQgY291bnQ7CiAJLyogdGhlIHNwYWNlIGNhbiBwbGFjZSBuZXcgZW50
cmllcyAqLwpAQCAtNDkyLDcgKzQ5MSw3IEBAIHVuc2lnbmVkIGxvbmcgYW1kZ3B1X3Jhc19xdWVy
eV9lcnJvcl9jb3VudChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAogLyogZXJyb3IgaGFu
ZGxpbmcgZnVuY3Rpb25zICovCiBpbnQgYW1kZ3B1X3Jhc19hZGRfYmFkX3BhZ2VzKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LAotCQl1bnNpZ25lZCBsb25nICpicHMsIGludCBwYWdlcyk7CisJ
CXN0cnVjdCBlZXByb21fdGFibGVfcmVjb3JkICpicHMsIGludCBwYWdlcyk7CiAKIGludCBhbWRn
cHVfcmFzX3Jlc2VydmVfYmFkX3BhZ2VzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKIAot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
