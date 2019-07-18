Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E545F6CC4D
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 11:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9246E388;
	Thu, 18 Jul 2019 09:49:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820085.outbound.protection.outlook.com [40.107.82.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585FB6E388
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 09:49:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTAdYlTXgLHU1iBRt7EHjzNZ/jK423NrikA4JHayLUi7A5sTV6TPlcw2rXp1GHHm+uJVnJ6MSHltB+yJQQUEuYcbYV37/uXHLm1IdvIe6ikdUhEQoqVQUSPPLv87eVEDh8yJh+UE35Sk8nkPHIuqqKykz4dVdzgm0dazNW6FctNX0hmPYmfCYEbfVTz+rMGIzPhoWx24km2dZ+ifEtdcsTDb6sODQ3O2A0pHo3tIitsRABElTGbKH5pPgqYTHHugI571sXe4IURRaEqKJnAVU4UDOI+iivhpIreBnY1mjQPADzAFhTYP84koNPTzqhmUty/VAIqJ0Wa9DACGwEkJjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zclohya8oPR4pK6j+ZDM/RDyYKBes9wDrSPRDdOCiI=;
 b=N+gue7w2dUropFZO4xtN4OoxigpPaPyODL9kNNqa1TFeVpDG6NSuzyst0ZbSmugRTV8LpLNYdmofPbomsgruluFaaS2hlFclKj0V3L6YEDPGXOFI3Y2BGNliyzk3dQEwHhD7B8030mmjAPg9ocDN40T7A0ePv15bDQIVHlNqAkKXfWcsZaLeYPXC2Rr00qP1zD4heoTFn4hT6zk+/FTeo/wJTGpevkSGcA/tWju0qvlPTsa4kEOFZpyXbhtoi/h86uhv9rVQBixmTFSjjHLe9sKV09a8o/SfQ28aYGxwrzSAc/73w/fI/7ZrKgLJLZzaRPXrO/9wO8tDcNy/zauQoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2SPR01MB0034.namprd12.prod.outlook.com (20.178.250.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 09:49:56 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 09:49:56 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/amd/powerplay: change sysfs pp_dpm_xxx format for
 navi10
Thread-Topic: [PATCH v2] drm/amd/powerplay: change sysfs pp_dpm_xxx format for
 navi10
Thread-Index: AQHVPU0zi/IEJ0Yhq0yFgHm+keJTNabQIZSA
Date: Thu, 18 Jul 2019 09:49:56 +0000
Message-ID: <MN2PR12MB3598D6F59B73A6508563CBA38EC80@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20190718094249.22234-1-kevin1.wang@amd.com>
In-Reply-To: <20190718094249.22234-1-kevin1.wang@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9321d0c6-6e67-4390-f5f6-08d70b654a92
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2SPR01MB0034; 
x-ms-traffictypediagnostic: MN2SPR01MB0034:
x-microsoft-antispam-prvs: <MN2SPR01MB0034A329B839BB1B9A6EDAF58EC80@MN2SPR01MB0034.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:293;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(366004)(376002)(396003)(39850400004)(199004)(189003)(13464003)(68736007)(8936002)(53936002)(26005)(7736002)(2906002)(229853002)(3846002)(6246003)(316002)(86362001)(54906003)(5660300002)(6506007)(52536014)(33656002)(2501003)(110136005)(446003)(486006)(14454004)(6436002)(81166006)(76176011)(305945005)(476003)(66556008)(8676002)(74316002)(186003)(66946007)(7696005)(81156014)(4326008)(71200400001)(11346002)(76116006)(25786009)(66476007)(66446008)(55016002)(99286004)(6116002)(9686003)(53546011)(256004)(102836004)(66066001)(478600001)(71190400001)(64756008)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2SPR01MB0034;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: n6wFEd5bPPhfYyHLS39sLJ8PHi+jWuyelv92PiSZYjpZj5vs4DqEt4okQztC8bXkTT8leFNKZoPKWOMmUwuGauKMdMerRx3CmdGcJYmVgMfPUBJEQsCzXC8uHfqRgaWVjB8hMckTvdnE0QmwV5F+YcX7PJVyeW1lkUPHByemp0cnu7nZAf3Dp7DVn5l9kZCa/9PplH+nJGAQ7u4oGDbRal24hmZoMP5MUrTdO8nIw8yFwub//6x9i4bt6fRMj7yrHECOQD4SpzDmJ7SZKxDw6S+vHycnT13lhME1XABhmo5KHm+dU2OK/1qp2Ts46Ahb2NQvm5+aaocyKYBInF1wA1EectJ/OHmxdiCYd8YUHP7ag/R2v9Fqo3OoQGmvY8LzXyWNoQWIjeldtCB08jdPQa76uz1DtDLUIw926CWTcSE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9321d0c6-6e67-4390-f5f6-08d70b654a92
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 09:49:56.5892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyfeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2SPR01MB0034
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zclohya8oPR4pK6j+ZDM/RDyYKBes9wDrSPRDdOCiI=;
 b=mYH4we98zxPiglXoHfYWq/2fleWFN6/+cNVgVF7lQ1eDe0ZHyBqF89/Uk6J8Mf++DhoZx9UzfwbILalgK62f6RO0WuzSLDeMokmBTV5oh0ctk1btd/tJqvdtBrOeDfpEA5ZRtYW2rwJTYqbDVF0SJrcL7xAtyOvQgdxveI62zSE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+CgoKCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tCkZyb206IFdhbmcsIEtldmluKFlhbmcpIApTZW50OiBUaHVy
c2RheSwgSnVseSAxOCwgMjAxOSA1OjQzIFBNClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpDYzogRmVuZywgS2VubmV0aCA8S2VubmV0aC5GZW5nQGFtZC5jb20+OyBRdWFuLCBFdmFu
IDxFdmFuLlF1YW5AYW1kLmNvbT47IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgWHUs
IEZlaWZlaSA8RmVpZmVpLlh1QGFtZC5jb20+OyBXYW5nLCBLZXZpbihZYW5nKSA8S2V2aW4xLldh
bmdAYW1kLmNvbT4KU3ViamVjdDogW1BBVENIIHYyXSBkcm0vYW1kL3Bvd2VycGxheTogY2hhbmdl
IHN5c2ZzIHBwX2RwbV94eHggZm9ybWF0IGZvciBuYXZpMTAKCnYyOgpzZXQgYXZlcmFnZSBjbG9j
ayB2YWx1ZSBvbiBsZXZlbCAxIHdoZW4gY3VycmVudCBjbG9jayBlcXVhbCBtaW4gb3IgbWF4IGNs
b2NrIChmaW5lIGdyYWluZWQgZHBtIHN1cHBvcnQpLgoKdGhlIG5hdmkxMCBnZnhjbGsgKHNjbGsp
IHN1cHBvcnQgZmluZSBncmFpbmVkIERQTSwgc28gdXNlIGxldmVsIDEgdG8gc2hvdyBjdXJyZW50
IGRwbSBmcmVxIGluIHN5c2ZzIHBwX2RwbV94eHgKCkNoYW5nZS1JZDogSTE0ZGFhNmUzMGM1MmM4
OTc5NTcwOGVjMDY2NjA4NjJiYjQ1OTEwMzYKU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2
aW4xLndhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMgfCA0NyArKysrKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNDEg
aW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9uYXZpMTBfcHB0LmMKaW5kZXggODk1YTRlNTkyZDVhLi4xZjcyMWI4NWMwZjYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTYyNywxMSArNjI3
LDI2IEBAIHN0YXRpYyBpbnQgbmF2aTEwX2dldF9jdXJyZW50X2Nsa19mcmVxX2J5X3RhYmxlKHN0
cnVjdCBzbXVfY29udGV4dCAqc211LAogCXJldHVybiByZXQ7CiB9CiAKK3N0YXRpYyBib29sIG5h
dmkxMF9pc19zdXBwb3J0X2ZpbmVfZ3JhaW5lZF9kcG0oc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
IAorZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUpIHsKKwlQUFRhYmxlX3QgKnBwdGFibGUgPSBz
bXUtPnNtdV90YWJsZS5kcml2ZXJfcHB0YWJsZTsKKwlEcG1EZXNjcmlwdG9yX3QgKmRwbV9kZXNj
ID0gTlVMTDsKKwl1aW50MzJfdCBjbGtfaW5kZXggPSAwOworCisJY2xrX2luZGV4ID0gc211X2Ns
a19nZXRfaW5kZXgoc211LCBjbGtfdHlwZSk7CisJZHBtX2Rlc2MgPSAmcHB0YWJsZS0+RHBtRGVz
Y3JpcHRvcltjbGtfaW5kZXhdOworCisJLyogMCAtIEZpbmUgZ3JhaW5lZCBEUE0sIDEgLSBEaXNj
cmV0ZSBEUE0gKi8KKwlyZXR1cm4gZHBtX2Rlc2MtPlNuYXBUb0Rpc2NyZXRlID09IDAgPyB0cnVl
IDogZmFsc2U7IH0KKwogc3RhdGljIGludCBuYXZpMTBfcHJpbnRfY2xrX2xldmVscyhzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSwKIAkJCWVudW0gc211X2Nsa190eXBlIGNsa190eXBlLCBjaGFyICpi
dWYpICB7CiAJaW50IGksIHNpemUgPSAwLCByZXQgPSAwOwogCXVpbnQzMl90IGN1cl92YWx1ZSA9
IDAsIHZhbHVlID0gMCwgY291bnQgPSAwOworCXVpbnQzMl90IGZyZXFfdmFsdWVzWzNdID0gezB9
OworCXVpbnQzMl90IG1hcmtfaW5kZXggPSAwOwogCiAJc3dpdGNoIChjbGtfdHlwZSkgewogCWNh
c2UgU01VX0dGWENMSzoKQEAgLTY0NCwyMiArNjU5LDQyIEBAIHN0YXRpYyBpbnQgbmF2aTEwX3By
aW50X2Nsa19sZXZlbHMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJCXJldCA9IHNtdV9nZXRf
Y3VycmVudF9jbGtfZnJlcShzbXUsIGNsa190eXBlLCAmY3VyX3ZhbHVlKTsKIAkJaWYgKHJldCkK
IAkJCXJldHVybiBzaXplOworCiAJCS8qIDEwS0h6IC0+IE1IeiAqLwogCQljdXJfdmFsdWUgPSBj
dXJfdmFsdWUgLyAxMDA7CiAKLQkJc2l6ZSArPSBzcHJpbnRmKGJ1ZiwgImN1cnJlbnQgY2xrOiAl
dU1oelxuIiwgY3VyX3ZhbHVlKTsKLQogCQlyZXQgPSBzbXVfZ2V0X2RwbV9sZXZlbF9jb3VudChz
bXUsIGNsa190eXBlLCAmY291bnQpOwogCQlpZiAocmV0KQogCQkJcmV0dXJuIHNpemU7CiAKLQkJ
Zm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsKLQkJCXJldCA9IHNtdV9nZXRfZHBtX2ZyZXFf
YnlfaW5kZXgoc211LCBjbGtfdHlwZSwgaSwgJnZhbHVlKTsKKwkJaWYgKCFuYXZpMTBfaXNfc3Vw
cG9ydF9maW5lX2dyYWluZWRfZHBtKHNtdSwgY2xrX3R5cGUpKSB7CisJCQlmb3IgKGkgPSAwOyBp
IDwgY291bnQ7IGkrKykgeworCQkJCXJldCA9IHNtdV9nZXRfZHBtX2ZyZXFfYnlfaW5kZXgoc211
LCBjbGtfdHlwZSwgaSwgJnZhbHVlKTsKKwkJCQlpZiAocmV0KQorCQkJCQlyZXR1cm4gc2l6ZTsK
KworCQkJCXNpemUgKz0gc3ByaW50ZihidWYgKyBzaXplLCAiJWQ6ICV1TWh6ICVzXG4iLCBpLCB2
YWx1ZSwKKwkJCQkJCWN1cl92YWx1ZSA9PSB2YWx1ZSA/ICIqIiA6ICIiKTsKKwkJCX0KKwkJfSBl
bHNlIHsKKwkJCXJldCA9IHNtdV9nZXRfZHBtX2ZyZXFfYnlfaW5kZXgoc211LCBjbGtfdHlwZSwg
MCwgJmZyZXFfdmFsdWVzWzBdKTsKKwkJCWlmIChyZXQpCisJCQkJcmV0dXJuIHNpemU7CisJCQly
ZXQgPSBzbXVfZ2V0X2RwbV9mcmVxX2J5X2luZGV4KHNtdSwgY2xrX3R5cGUsIGNvdW50IC0gMSwg
CismZnJlcV92YWx1ZXNbMl0pOwogCQkJaWYgKHJldCkKIAkJCQlyZXR1cm4gc2l6ZTsKIAotCQkJ
c2l6ZSArPSBzcHJpbnRmKGJ1ZiArIHNpemUsICIlZDogJXVNaHogJXNcbiIsIGksIHZhbHVlLAot
CQkJCQljdXJfdmFsdWUgPT0gdmFsdWUgPyAiKiIgOiAiIik7CisJCQlmcmVxX3ZhbHVlc1sxXSA9
IGN1cl92YWx1ZTsKKwkJCW1hcmtfaW5kZXggPSBjdXJfdmFsdWUgPT0gZnJlcV92YWx1ZXNbMF0g
PyAwIDoKKwkJCQkgICAgIGN1cl92YWx1ZSA9PSBmcmVxX3ZhbHVlc1syXSA/IDIgOiAxOworCQkJ
aWYgKG1hcmtfaW5kZXggIT0gMSkKKwkJCQlmcmVxX3ZhbHVlc1sxXSA9IChmcmVxX3ZhbHVlc1sw
XSArIGZyZXFfdmFsdWVzWzJdKSAvIDI7CisKKwkJCWZvciAoaSA9IDA7IGkgPCAzOyBpKyspIHsK
KwkJCQlzaXplICs9IHNwcmludGYoYnVmICsgc2l6ZSwgIiVkOiAldU1oeiAlc1xuIiwgaSwgZnJl
cV92YWx1ZXNbaV0sCisJCQkJCQlpID09IG1hcmtfaW5kZXggPyAiKiIgOiAiIik7CisJCQl9CisK
IAkJfQogCQlicmVhazsKIAlkZWZhdWx0OgotLQoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
