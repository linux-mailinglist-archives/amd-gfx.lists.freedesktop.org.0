Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 534A3669C1
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 11:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FEE6E32D;
	Fri, 12 Jul 2019 09:15:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760071.outbound.protection.outlook.com [40.107.76.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D50D6E32D
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 09:15:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhmlnMTEWZ5WMiB4Mq6hlYTicteLP9pTw0Kk56RItORYsP9hPVlfAzs3ejd4EyabTus4iV1+V1cDr3dQaDSglS0MHrmXpe9ukW1HSNILyueZsJBYnBP5qE6KuFZSBcwUfnqhfidi0WZF5Awu7hwNcRrvWNkwChGD+1Y2+5cinqOVWrBC37wjALahHVsVC89HzYCVcMULHvBpyOY1hBUx3MjB5fYGUL+mnbIOxDRMDrs5Pj+QGvLOVQgqaJ39WPDpjRMfdJvwxjNEFv1WMs46YApT5CTTP2IIOuH454bBcaeNfh/y9Yzu3kMkHgxw8rXFCfKCl5RxwWbY4pDsgLBPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyS7wbBtgh/FkYW+R6PbH0D+0YRZL6RWJHW4fauWAZM=;
 b=PEFegwsxDBgyK1PTCiz1Hz9LTOJgGlHDNgwzoQINKIM2fiJrKWOutdaMULKvxifdzWB0jE/VSogPoYTfVRfarCXvLPRr5cjmg4cGHODHHjNNjkHC07gnyk+iyUZRgsoLy/OSuagERkofIOrjcmOHECjzW5hmFzNE8ExoZm3SzrmzWa5ukN9XtsWdGq4mjBPKAig4Fyq/wFGqdRczms4z3SZ9Yl7FuKdZ0xUITfB1AzlDQ8aKH9ZV2bKcsYsMs2I8A2v8IhrJ/G9fb2Bd165ZOt4tZtZ5i699w4DER2ici9Pinlwfsk0y3nfCK6L2WrOedFMVDAT2tl4wqATJYmrCaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3102.namprd12.prod.outlook.com (20.178.241.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Fri, 12 Jul 2019 09:15:08 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e%3]) with mapi id 15.20.2052.020; Fri, 12 Jul 2019
 09:15:08 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amd/powerplay: add helper of smu_feature_dpmclk_check
 for smu
Thread-Topic: [PATCH 1/3] drm/amd/powerplay: add helper of
 smu_feature_dpmclk_check for smu
Thread-Index: AQHVOJJMDUrSSG/DaE66lPb61t/WdA==
Date: Fri, 12 Jul 2019 09:15:08 +0000
Message-ID: <20190712091454.13478-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::33) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a90d77a1-ac4a-4243-91f5-08d706a96f34
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3102; 
x-ms-traffictypediagnostic: MN2PR12MB3102:
x-microsoft-antispam-prvs: <MN2PR12MB310207807081818FA0673A45A2F20@MN2PR12MB3102.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(189003)(199004)(478600001)(2351001)(2501003)(6486002)(6436002)(5640700003)(4326008)(71200400001)(71190400001)(5660300002)(81156014)(8676002)(81166006)(99286004)(6512007)(52116002)(102836004)(53936002)(256004)(6506007)(14444005)(386003)(25786009)(1076003)(2616005)(486006)(476003)(54906003)(6916009)(26005)(66066001)(8936002)(2906002)(86362001)(186003)(3846002)(305945005)(7736002)(6116002)(36756003)(316002)(66476007)(66446008)(64756008)(66556008)(66946007)(50226002)(68736007)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3102;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rCD5gXCkTZmjkhUVukQJE81fv7hOPXuy9jTx3ir4SBAPLJZ40GOLvWk/tJUHbn66gwJSJJVyb4NSyDKHATmxEjBX4lEqrclNfcXnsH9oPrzSEUbpOU6yxTIWP/REgYXQx0A6dGMwtMxvSyX8RxJs/ImrN/+K8TWhssKHS54LdSI7WVmdkVatiuGmCSNxMDF7o0Tu57SAesOfgTwNFNh+PUnMqntrZZ16GpLVBgIG7nDdP7+5zJvQ87wZu9z/A1lv2e68eST+uJTnOi7fWCC5PT6ZIpgdJc0+mQavfHUmYmgQMUBP4x0YffgfsXg9hwDTOSA9M/3gOOW6m8H9Q5zAH2FburkExD4VJIOIj104xRA2W+kWCc3xKV0U9Dv9P09rgFLy0k/21jI4o2mZdDt2rYxOCvE8nFsT2M/V7VUFb70=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a90d77a1-ac4a-4243-91f5-08d706a96f34
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 09:15:08.5298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3102
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyS7wbBtgh/FkYW+R6PbH0D+0YRZL6RWJHW4fauWAZM=;
 b=yKF3kk5lkyzG4ALgWh075bfQYtBPOSQ5SBMzKVbaQNOBOktf2QCwwTN7JS2QhVXz37D+ouBNydvWq6UpDVXyFY2bihwQkVMzulKs0Su6y1x5JYr+D7x4eEbqIOyE8IW6EijH98HbLfklgeg5GK3HS49DWsIv+C+jFae8RtVGbe4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>, "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YWRkIHRoaXMgaGVscGVyIGZ1bmN0aW9uIHRvIGNoZWNrIGRwbSBjbGsgZmVhdHVyZSBpcyBlbmFi
bGVkLgoKQ2hhbmdlLUlkOiBJNTFhNGU5MjQ2ZDgzZDc0YThlNjg3ZmJjNDU5ODM4NDhhZGM5NjBj
YQpTaWduZWQtb2ZmLWJ5OiBLZXZpbiBXYW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyAgICB8IDcxICsrKysrKysr
KysrKystLS0tLS0KIC4uLi9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCAg
ICB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3Nt
dS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IGRh
NDMzMmQyZGJiYy4uYmU5MGFlNTlkZmE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvYW1kZ3B1X3NtdS5jCkBAIC02OCw2ICs2OCwxMCBAQCBpbnQgc211X3NldF9zb2Z0X2ZyZXFf
cmFuZ2Uoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gc211X2Nsa190eXBlIGNsa190eXBl
LAogCWlmIChtaW4gPD0gMCAmJiBtYXggPD0gMCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKKwlyZXQg
PSBzbXVfZmVhdHVyZV9kcG1jbGtfY2hlY2soc211LCBjbGtfdHlwZSk7CisJaWYgKHJldCkKKwkJ
cmV0dXJuIHJldDsKKwogCWNsa19pZCA9IHNtdV9jbGtfZ2V0X2luZGV4KHNtdSwgY2xrX3R5cGUp
OwogCWlmIChjbGtfaWQgPCAwKQogCQlyZXR1cm4gY2xrX2lkOwpAQCAtMTAxLDYgKzEwNSwxMCBA
QCBpbnQgc211X3NldF9oYXJkX2ZyZXFfcmFuZ2Uoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVu
dW0gc211X2Nsa190eXBlIGNsa190eXBlLAogCWlmIChtaW4gPD0gMCAmJiBtYXggPD0gMCkKIAkJ
cmV0dXJuIC1FSU5WQUw7CiAKKwlyZXQgPSBzbXVfZmVhdHVyZV9kcG1jbGtfY2hlY2soc211LCBj
bGtfdHlwZSk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKwogCWNsa19pZCA9IHNtdV9jbGtf
Z2V0X2luZGV4KHNtdSwgY2xrX3R5cGUpOwogCWlmIChjbGtfaWQgPCAwKQogCQlyZXR1cm4gY2xr
X2lkOwpAQCAtMTM0LDI5ICsxNDIsOSBAQCBpbnQgc211X2dldF9kcG1fZnJlcV9yYW5nZShzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUsCiAJaWYgKCFt
aW4gJiYgIW1heCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQlzd2l0Y2ggKGNsa190eXBlKSB7Ci0J
Y2FzZSBTTVVfTUNMSzoKLQljYXNlIFNNVV9VQ0xLOgotCQlpZiAoIXNtdV9mZWF0dXJlX2lzX2Vu
YWJsZWQoc211LCBTTVVfRkVBVFVSRV9EUE1fVUNMS19CSVQpKSB7Ci0JCQlwcl93YXJuKCJ1Y2xr
IGRwbSBpcyBub3QgZW5hYmxlZFxuIik7Ci0JCQlyZXR1cm4gMDsKLQkJfQotCQlicmVhazsKLQlj
YXNlIFNNVV9HRlhDTEs6Ci0JY2FzZSBTTVVfU0NMSzoKLQkJaWYgKCFzbXVfZmVhdHVyZV9pc19l
bmFibGVkKHNtdSwgU01VX0ZFQVRVUkVfRFBNX0dGWENMS19CSVQpKSB7Ci0JCQlwcl93YXJuKCJn
ZnhjbGsgZHBtIGlzIG5vdCBlbmFibGVkXG4iKTsKLQkJCXJldHVybiAwOwotCQl9Ci0JY2FzZSBT
TVVfU09DQ0xLOgotCQlpZiAoIXNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LCBTTVVfRkVBVFVS
RV9EUE1fU09DQ0xLX0JJVCkpIHsKLQkJCXByX3dhcm4oInNvY2tjbGsgZHBtIGlzIG5vdCBlbmFi
bGVkXG4iKTsKLQkJCXJldHVybiAwOwotCQl9Ci0JCWJyZWFrOwotCWRlZmF1bHQ6Ci0JCWJyZWFr
OwotCX0KKwlyZXQgPSBzbXVfZmVhdHVyZV9kcG1jbGtfY2hlY2soc211LCBjbGtfdHlwZSk7CisJ
aWYgKHJldCkKKwkJcmV0dXJuIHJldDsKIAogCW11dGV4X2xvY2soJnNtdS0+bXV0ZXgpOwogCWNs
a19pZCA9IHNtdV9jbGtfZ2V0X2luZGV4KHNtdSwgY2xrX3R5cGUpOwpAQCAtMTk5LDYgKzE4Nywx
MCBAQCBpbnQgc211X2dldF9kcG1fZnJlcV9ieV9pbmRleChzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSwgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cAogCWlmICghdmFsdWUpCiAJCXJldHVybiAtRUlO
VkFMOwogCisJcmV0ID0gc211X2ZlYXR1cmVfZHBtY2xrX2NoZWNrKHNtdSwgY2xrX3R5cGUpOwor
CWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKIAljbGtfaWQgPSBzbXVfY2xrX2dldF9pbmRleChz
bXUsIGNsa190eXBlKTsKIAlpZiAoY2xrX2lkIDwgMCkKIAkJcmV0dXJuIGNsa19pZDsKQEAgLTIy
Nyw2ICsyMTksMzkgQEAgaW50IHNtdV9nZXRfZHBtX2xldmVsX2NvdW50KHN0cnVjdCBzbXVfY29u
dGV4dCAqc211LCBlbnVtIHNtdV9jbGtfdHlwZSBjbGtfdHlwZSwKIAlyZXR1cm4gc211X2dldF9k
cG1fZnJlcV9ieV9pbmRleChzbXUsIGNsa190eXBlLCAweGZmLCB2YWx1ZSk7CiB9CiAKK2ludCBz
bXVfZmVhdHVyZV9kcG1jbGtfY2hlY2soc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gc211
X2Nsa190eXBlIGNsa190eXBlKQoreworCWludCByZXQgPSAwOworCisJc3dpdGNoIChjbGtfdHlw
ZSkgeworCWNhc2UgU01VX01DTEs6CisJY2FzZSBTTVVfVUNMSzoKKwkJaWYgKCFzbXVfZmVhdHVy
ZV9pc19lbmFibGVkKHNtdSwgU01VX0ZFQVRVUkVfRFBNX1VDTEtfQklUKSkgeworCQkJcHJfd2Fy
bigidWNsayBkcG0gaXMgbm90IGVuYWJsZWRcbiIpOworCQkJcmV0ID0gLUVBQ0NFUzsKKwkJfQor
CQlicmVhazsKKwljYXNlIFNNVV9HRlhDTEs6CisJY2FzZSBTTVVfU0NMSzoKKwkJaWYgKCFzbXVf
ZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgU01VX0ZFQVRVUkVfRFBNX0dGWENMS19CSVQpKSB7CisJ
CQlwcl93YXJuKCJnZnhjbGsgZHBtIGlzIG5vdCBlbmFibGVkXG4iKTsKKwkJCXJldCA9IC1FQUND
RVM7CisJCX0KKwljYXNlIFNNVV9TT0NDTEs6CisJCWlmICghc211X2ZlYXR1cmVfaXNfZW5hYmxl
ZChzbXUsIFNNVV9GRUFUVVJFX0RQTV9TT0NDTEtfQklUKSkgeworCQkJcHJfd2Fybigic29ja2Ns
ayBkcG0gaXMgbm90IGVuYWJsZWRcbiIpOworCQkJcmV0ID0gLUVBQ0NFUzsKKwkJfQorCQlicmVh
azsKKwlkZWZhdWx0OgorCQlyZXQgPSAwOworCQlicmVhazsKKwl9CisKKwlyZXR1cm4gcmV0Owor
fQorCisKIGludCBzbXVfZHBtX3NldF9wb3dlcl9nYXRlKHN0cnVjdCBzbXVfY29udGV4dCAqc211
LCB1aW50MzJfdCBibG9ja190eXBlLAogCQkJICAgYm9vbCBnYXRlKQogewpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKaW5kZXggYzk3MzI0ZWY3ZGIy
Li4wZmJjOGY0ODlhNDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2luYy9hbWRncHVfc211LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5j
L2FtZGdwdV9zbXUuaApAQCAtOTczLDUgKzk3Myw2IEBAIGludCBzbXVfc2V0X2hhcmRfZnJlcV9y
YW5nZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUs
CiBlbnVtIGFtZF9kcG1fZm9yY2VkX2xldmVsIHNtdV9nZXRfcGVyZm9ybWFuY2VfbGV2ZWwoc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUpOwogaW50IHNtdV9mb3JjZV9wZXJmb3JtYW5jZV9sZXZlbChz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBhbWRfZHBtX2ZvcmNlZF9sZXZlbCBsZXZlbCk7
CiBpbnQgc211X3NldF9kaXNwbGF5X2NvdW50KHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50
MzJfdCBjb3VudCk7CitpbnQgc211X2ZlYXR1cmVfZHBtY2xrX2NoZWNrKHN0cnVjdCBzbXVfY29u
dGV4dCAqc211LCBlbnVtIHNtdV9jbGtfdHlwZSBjbGtfdHlwZSk7CiAKICNlbmRpZgotLSAKMi4y
Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
