Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1397BAD4C
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 06:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF316E0DA;
	Mon, 23 Sep 2019 04:30:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760081.outbound.protection.outlook.com [40.107.76.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04056E060
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 04:29:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZnGq9yRK+fr8Yve6AK8E1WFFFBMT5ak//Dj0h3H4KUyALVXiPAXedbwd0D3jdn7OWqoVow+f5CUAIkCdYxWlCQuUwDlN6fmK4IqxH7KvL0QXSbgOVXZmM3nrCU/QX5Sbry4Tev9KVSaKnbQImHeybtQ9nvcgC8zrg0XYQ5sHg3rTGpD++ET/rpfXB0Ohilr96iR+hiFI+RcuByGy+i8r9ZWZGt5F1vDh3kpWvP7xqvcZFbxXAQhqMTIlzf5O2Kj/KhE00k2RptVi6JG6c+xI9JTIfDSjMeYdkytdQcypsB6RgS0rs1HU21h9yVW8iu3XVvZ4P7vGp7DKQr2IA3WbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIWS+9QhxUeHx055KCeGquF8hNgEeufcIGS5eaShKwE=;
 b=J0+HrfRc/nYeuU2q30T39KPbYyR9Cu2cQXl2HJxZGpuzDVS1TsAmgRl6T+II4oWRE0yQWk4r6gK26vSwUtCBTT7OKGuHBGmQWPsOfwm7l70WVFJcCxzEx2dZjO5bKUwI032bVuq3Igdj/ayrvbZUT+9uCyrWxXseI5wKaiOPul0WdovT4KaGMGQNtvxnWB2Kueg0Su/N2ryQfFrTfL/hp3gk96EIJv0IXd6vXiXQRV+wVYzm7R0LvrALCHh45303Z+aIsC/3TeK97DdGXtYtuK9cmCEMT04qv+eJmajrOYZBSjOsHZ+eW1i/81fSD8VslOH2CT6xXjNHxiOFeDOKjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB4186.namprd12.prod.outlook.com (10.141.186.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Mon, 23 Sep 2019 04:29:56 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 04:29:56 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amdkfd: Add an error print if SDMA RLC is not idle
Thread-Topic: [PATCH 1/3] drm/amdkfd: Add an error print if SDMA RLC is not
 idle
Thread-Index: AQHVcceNw1sr3evRqEipmnM2cRNAFw==
Date: Mon, 23 Sep 2019 04:29:56 +0000
Message-ID: <20190923042944.15314-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::32) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a664cd5-2e37-4dd8-1c55-08d73fdeafb4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB4186; 
x-ms-traffictypediagnostic: DM6PR12MB4186:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4186AE8C186BB0EB65DBCC77F0850@DM6PR12MB4186.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:46;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(189003)(199004)(66476007)(64756008)(66556008)(66446008)(5660300002)(386003)(8936002)(66946007)(81156014)(476003)(2616005)(1076003)(316002)(86362001)(81166006)(6506007)(6916009)(2501003)(66066001)(2906002)(71200400001)(71190400001)(305945005)(7736002)(14454004)(478600001)(186003)(25786009)(99286004)(50226002)(6116002)(256004)(36756003)(3846002)(6512007)(52116002)(26005)(4326008)(8676002)(5640700003)(102836004)(6436002)(2351001)(6486002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4186;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ExVvICJ1lqcCLLGsl3Zm+hpABnDVzNGwZYnW3pYUQvvmMDL6gWTuaq35aWd3iB2lOz20G7ZEQ6SYm/4J1jresK4g8Qu7V0T8LtALxrmueIU3mjD5oS2HJIBFImaa+IymZ5ex7sYdDrq03zqTlueV6cKFjYYD277nwsT/Bxqpn1+7PFTLW1epjz0ysxRf5+S5B4m+WS53E1zz5FhZpoMpQV3hGDcVlA1P5lJNryyuv+GIInuSOFDfkiibqwix4ZiWLlxIOZQW/SEL/xVDkvmiFWZIxGNd5YGz5TfQUuDtAjD3qowcw7ozYXJrO2BxB7y+HcvxQ0bcSijQhM7desySaDDjUPhia+xaFPIMD3BwGj8uK0p0fXCsYb+Cwh+nADOaBgxaDUqLaTNkS0bBduNnhia8koQlmZj69oM1aDela2I=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a664cd5-2e37-4dd8-1c55-08d73fdeafb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 04:29:56.1059 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aG9DjUrnNR4zywrBZxVfs6l6w52mhBdxQQlIkmupkkwQUGG0FfcrIAZ49i8fvhNy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIWS+9QhxUeHx055KCeGquF8hNgEeufcIGS5eaShKwE=;
 b=WRbe1q5tW5ed9cDMQxb+CMTNfOZCo2zXjGQSUtXguYsLnbuPktP/GLLJJ7Efx2hYTDOsDra0q82EoDg0O47JQy0ci6u2M9pDDO4G8lr+zxcjQIA218FusdNdl231gep4UNhS6Xa9Ao61MpalchAuzlpmBo8U0fNHptXHmrrAubg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIG1lc3NhZ2Ugd2lsbCBiZSB1c2VmdWwgd2hlbiB0cm91Ymxlc2hvb3RpbmcgdGhlIGlzc3Vl
cy4KCkNoYW5nZS1JZDogSWQ4MmJiZTgwODEwZGNjZmY2N2M1YjEyNzVlOTc3OWY2YTk0NWRjN2EK
U2lnbmVkLW9mZi1ieTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2FyY3R1cnVzLmMgfCA4ICsrKysrKy0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92MTAuYyAgfCA4
ICsrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92
Ny5jICAgfCA4ICsrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1k
a2ZkX2dmeF92OC5jICAgfCA4ICsrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfYW1ka2ZkX2dmeF92OS5jICAgfCA4ICsrKysrKy0tCiA1IGZpbGVzIGNoYW5nZWQsIDMw
IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfYXJjdHVydXMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfYXJjdHVydXMuYwppbmRleCBkMmMwNjY2YzI3OTgu
LjBjMjhlODM4MTYyYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FtZGtmZF9hcmN0dXJ1cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hbWRrZmRfYXJjdHVydXMuYwpAQCAtMTI0LDggKzEyNCwxMCBAQCBzdGF0aWMgaW50IGtn
ZF9ocWRfc2RtYV9sb2FkKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHZvaWQgKm1xZCwKIAkJZGF0YSA9
IFJSRUczMihybGNfcmVnX29mZnNldCArIG1tU0RNQTBfUkxDMF9DT05URVhUX1NUQVRVUyk7CiAJ
CWlmIChkYXRhICYgU0RNQTBfUkxDMF9DT05URVhUX1NUQVRVU19fSURMRV9NQVNLKQogCQkJYnJl
YWs7Ci0JCWlmICh0aW1lX2FmdGVyKGppZmZpZXMsIGVuZF9qaWZmaWVzKSkKKwkJaWYgKHRpbWVf
YWZ0ZXIoamlmZmllcywgZW5kX2ppZmZpZXMpKSB7CisJCQlwcl9lcnIoIlNETUEgUkxDIG5vdCBp
ZGxlIGluICVzXG4iLCBfX2Z1bmNfXyk7CiAJCQlyZXR1cm4gLUVUSU1FOworCQl9CiAJCXVzbGVl
cF9yYW5nZSg1MDAsIDEwMDApOwogCX0KIApAQCAtMjM5LDggKzI0MSwxMCBAQCBzdGF0aWMgaW50
IGtnZF9ocWRfc2RtYV9kZXN0cm95KHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHZvaWQgKm1xZCwKIAkJ
dGVtcCA9IFJSRUczMihybGNfcmVnX29mZnNldCArIG1tU0RNQTBfUkxDMF9DT05URVhUX1NUQVRV
Uyk7CiAJCWlmICh0ZW1wICYgU0RNQTBfUkxDMF9DT05URVhUX1NUQVRVU19fSURMRV9NQVNLKQog
CQkJYnJlYWs7Ci0JCWlmICh0aW1lX2FmdGVyKGppZmZpZXMsIGVuZF9qaWZmaWVzKSkKKwkJaWYg
KHRpbWVfYWZ0ZXIoamlmZmllcywgZW5kX2ppZmZpZXMpKSB7CisJCQlwcl9lcnIoIlNETUEgUkxD
IG5vdCBpZGxlIGluICVzXG4iLCBfX2Z1bmNfXyk7CiAJCQlyZXR1cm4gLUVUSU1FOworCQl9CiAJ
CXVzbGVlcF9yYW5nZSg1MDAsIDEwMDApOwogCX0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjEwLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92MTAuYwppbmRleCBlZTUyMGFkOTA3MTcuLjMx
MzcyZDhlNDQyNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2FtZGtmZF9nZnhfdjEwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2FtZGtmZF9nZnhfdjEwLmMKQEAgLTUwNyw4ICs1MDcsMTAgQEAgc3RhdGljIGludCBrZ2RfaHFk
X3NkbWFfbG9hZChzdHJ1Y3Qga2dkX2RldiAqa2dkLCB2b2lkICptcWQsCiAJCWRhdGEgPSBSUkVH
MzIocmxjX3JlZ19vZmZzZXQgKyBtbVNETUEwX1JMQzBfQ09OVEVYVF9TVEFUVVMpOwogCQlpZiAo
ZGF0YSAmIFNETUEwX1JMQzBfQ09OVEVYVF9TVEFUVVNfX0lETEVfTUFTSykKIAkJCWJyZWFrOwot
CQlpZiAodGltZV9hZnRlcihqaWZmaWVzLCBlbmRfamlmZmllcykpCisJCWlmICh0aW1lX2FmdGVy
KGppZmZpZXMsIGVuZF9qaWZmaWVzKSkgeworCQkJcHJfZXJyKCJTRE1BIFJMQyBub3QgaWRsZSBp
biAlc1xuIiwgX19mdW5jX18pOwogCQkJcmV0dXJuIC1FVElNRTsKKwkJfQogCQl1c2xlZXBfcmFu
Z2UoNTAwLCAxMDAwKTsKIAl9CiAKQEAgLTc1Miw4ICs3NTQsMTAgQEAgc3RhdGljIGludCBrZ2Rf
aHFkX3NkbWFfZGVzdHJveShzdHJ1Y3Qga2dkX2RldiAqa2dkLCB2b2lkICptcWQsCiAJCXRlbXAg
PSBSUkVHMzIocmxjX3JlZ19vZmZzZXQgKyBtbVNETUEwX1JMQzBfQ09OVEVYVF9TVEFUVVMpOwog
CQlpZiAodGVtcCAmIFNETUEwX1JMQzBfQ09OVEVYVF9TVEFUVVNfX0lETEVfTUFTSykKIAkJCWJy
ZWFrOwotCQlpZiAodGltZV9hZnRlcihqaWZmaWVzLCBlbmRfamlmZmllcykpCisJCWlmICh0aW1l
X2FmdGVyKGppZmZpZXMsIGVuZF9qaWZmaWVzKSkgeworCQkJcHJfZXJyKCJTRE1BIFJMQyBub3Qg
aWRsZSBpbiAlc1xuIiwgX19mdW5jX18pOwogCQkJcmV0dXJuIC1FVElNRTsKKwkJfQogCQl1c2xl
ZXBfcmFuZ2UoNTAwLCAxMDAwKTsKIAl9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ2Z4X3Y3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92Ny5jCmluZGV4IGQwNTE3YjdhZTA4OS4uNjI4OGRlNGM5
NDNkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2Zk
X2dmeF92Ny5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRf
Z2Z4X3Y3LmMKQEAgLTQyNyw4ICs0MjcsMTAgQEAgc3RhdGljIGludCBrZ2RfaHFkX3NkbWFfbG9h
ZChzdHJ1Y3Qga2dkX2RldiAqa2dkLCB2b2lkICptcWQsCiAJCWRhdGEgPSBSUkVHMzIoc2RtYV9i
YXNlX2FkZHIgKyBtbVNETUEwX1JMQzBfQ09OVEVYVF9TVEFUVVMpOwogCQlpZiAoZGF0YSAmIFNE
TUEwX1JMQzBfQ09OVEVYVF9TVEFUVVNfX0lETEVfTUFTSykKIAkJCWJyZWFrOwotCQlpZiAodGlt
ZV9hZnRlcihqaWZmaWVzLCBlbmRfamlmZmllcykpCisJCWlmICh0aW1lX2FmdGVyKGppZmZpZXMs
IGVuZF9qaWZmaWVzKSkgeworCQkJcHJfZXJyKCJTRE1BIFJMQyBub3QgaWRsZSBpbiAlc1xuIiwg
X19mdW5jX18pOwogCQkJcmV0dXJuIC1FVElNRTsKKwkJfQogCQl1c2xlZXBfcmFuZ2UoNTAwLCAx
MDAwKTsKIAl9CiAJaWYgKG0tPnNkbWFfZW5naW5lX2lkKSB7CkBAIC02NjAsOCArNjYyLDEwIEBA
IHN0YXRpYyBpbnQga2dkX2hxZF9zZG1hX2Rlc3Ryb3koc3RydWN0IGtnZF9kZXYgKmtnZCwgdm9p
ZCAqbXFkLAogCQl0ZW1wID0gUlJFRzMyKHNkbWFfYmFzZV9hZGRyICsgbW1TRE1BMF9STEMwX0NP
TlRFWFRfU1RBVFVTKTsKIAkJaWYgKHRlbXAgJiBTRE1BMF9STEMwX0NPTlRFWFRfU1RBVFVTX19J
RExFX01BU0spCiAJCQlicmVhazsKLQkJaWYgKHRpbWVfYWZ0ZXIoamlmZmllcywgZW5kX2ppZmZp
ZXMpKQorCQlpZiAodGltZV9hZnRlcihqaWZmaWVzLCBlbmRfamlmZmllcykpIHsKKwkJCXByX2Vy
cigiU0RNQSBSTEMgbm90IGlkbGUgaW4gJXNcbiIsIF9fZnVuY19fKTsKIAkJCXJldHVybiAtRVRJ
TUU7CisJCX0KIAkJdXNsZWVwX3JhbmdlKDUwMCwgMTAwMCk7CiAJfQogCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92OC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjguYwppbmRleCAzNzM1MDFh
YmRiNmIuLmE3ZTU0NjRkZjg1ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjguYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYW1ka2ZkX2dmeF92OC5jCkBAIC00MTEsOCArNDExLDEwIEBAIHN0YXRpYyBpbnQg
a2dkX2hxZF9zZG1hX2xvYWQoc3RydWN0IGtnZF9kZXYgKmtnZCwgdm9pZCAqbXFkLAogCQlkYXRh
ID0gUlJFRzMyKHNkbWFfYmFzZV9hZGRyICsgbW1TRE1BMF9STEMwX0NPTlRFWFRfU1RBVFVTKTsK
IAkJaWYgKGRhdGEgJiBTRE1BMF9STEMwX0NPTlRFWFRfU1RBVFVTX19JRExFX01BU0spCiAJCQli
cmVhazsKLQkJaWYgKHRpbWVfYWZ0ZXIoamlmZmllcywgZW5kX2ppZmZpZXMpKQorCQlpZiAodGlt
ZV9hZnRlcihqaWZmaWVzLCBlbmRfamlmZmllcykpIHsKKwkJCXByX2VycigiU0RNQSBSTEMgbm90
IGlkbGUgaW4gJXNcbiIsIF9fZnVuY19fKTsKIAkJCXJldHVybiAtRVRJTUU7CisJCX0KIAkJdXNs
ZWVwX3JhbmdlKDUwMCwgMTAwMCk7CiAJfQogCWlmIChtLT5zZG1hX2VuZ2luZV9pZCkgewpAQCAt
NjU2LDggKzY1OCwxMCBAQCBzdGF0aWMgaW50IGtnZF9ocWRfc2RtYV9kZXN0cm95KHN0cnVjdCBr
Z2RfZGV2ICprZ2QsIHZvaWQgKm1xZCwKIAkJdGVtcCA9IFJSRUczMihzZG1hX2Jhc2VfYWRkciAr
IG1tU0RNQTBfUkxDMF9DT05URVhUX1NUQVRVUyk7CiAJCWlmICh0ZW1wICYgU0RNQTBfUkxDMF9D
T05URVhUX1NUQVRVU19fSURMRV9NQVNLKQogCQkJYnJlYWs7Ci0JCWlmICh0aW1lX2FmdGVyKGpp
ZmZpZXMsIGVuZF9qaWZmaWVzKSkKKwkJaWYgKHRpbWVfYWZ0ZXIoamlmZmllcywgZW5kX2ppZmZp
ZXMpKSB7CisJCQlwcl9lcnIoIlNETUEgUkxDIG5vdCBpZGxlIGluICVzXG4iLCBfX2Z1bmNfXyk7
CiAJCQlyZXR1cm4gLUVUSU1FOworCQl9CiAJCXVzbGVlcF9yYW5nZSg1MDAsIDEwMDApOwogCX0K
IApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9n
ZnhfdjkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ2Z4X3Y5
LmMKaW5kZXggMmRkNWJjNjc2MDI5Li5iZmQ4OWY1ZDFiZWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ2Z4X3Y5LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjkuYwpAQCAtNDA0LDggKzQwNCwx
MCBAQCBzdGF0aWMgaW50IGtnZF9ocWRfc2RtYV9sb2FkKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHZv
aWQgKm1xZCwKIAkJZGF0YSA9IFJSRUczMihybGNfcmVnX29mZnNldCArIG1tU0RNQTBfUkxDMF9D
T05URVhUX1NUQVRVUyk7CiAJCWlmIChkYXRhICYgU0RNQTBfUkxDMF9DT05URVhUX1NUQVRVU19f
SURMRV9NQVNLKQogCQkJYnJlYWs7Ci0JCWlmICh0aW1lX2FmdGVyKGppZmZpZXMsIGVuZF9qaWZm
aWVzKSkKKwkJaWYgKHRpbWVfYWZ0ZXIoamlmZmllcywgZW5kX2ppZmZpZXMpKSB7CisJCQlwcl9l
cnIoIlNETUEgUkxDIG5vdCBpZGxlIGluICVzXG4iLCBfX2Z1bmNfXyk7CiAJCQlyZXR1cm4gLUVU
SU1FOworCQl9CiAJCXVzbGVlcF9yYW5nZSg1MDAsIDEwMDApOwogCX0KIApAQCAtNTkxLDggKzU5
MywxMCBAQCBzdGF0aWMgaW50IGtnZF9ocWRfc2RtYV9kZXN0cm95KHN0cnVjdCBrZ2RfZGV2ICpr
Z2QsIHZvaWQgKm1xZCwKIAkJdGVtcCA9IFJSRUczMihybGNfcmVnX29mZnNldCArIG1tU0RNQTBf
UkxDMF9DT05URVhUX1NUQVRVUyk7CiAJCWlmICh0ZW1wICYgU0RNQTBfUkxDMF9DT05URVhUX1NU
QVRVU19fSURMRV9NQVNLKQogCQkJYnJlYWs7Ci0JCWlmICh0aW1lX2FmdGVyKGppZmZpZXMsIGVu
ZF9qaWZmaWVzKSkKKwkJaWYgKHRpbWVfYWZ0ZXIoamlmZmllcywgZW5kX2ppZmZpZXMpKSB7CisJ
CQlwcl9lcnIoIlNETUEgUkxDIG5vdCBpZGxlIGluICVzXG4iLCBfX2Z1bmNfXyk7CiAJCQlyZXR1
cm4gLUVUSU1FOworCQl9CiAJCXVzbGVlcF9yYW5nZSg1MDAsIDEwMDApOwogCX0KIAotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
