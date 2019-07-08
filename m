Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E193861B23
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 09:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF508982D;
	Mon,  8 Jul 2019 07:14:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680066.outbound.protection.outlook.com [40.107.68.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4356A8982D
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 07:14:26 +0000 (UTC)
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (52.135.107.150) by
 SN6PR12MB2736.namprd12.prod.outlook.com (52.135.107.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Mon, 8 Jul 2019 07:14:23 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4c4f:4a38:712d:928d]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4c4f:4a38:712d:928d%5]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 07:14:23 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH libdrm] tests/amdgpu: rename error inject test to umc error
Thread-Topic: [PATCH libdrm] tests/amdgpu: rename error inject test to umc
 error
Thread-Index: AdU1XLdmYrptW1m4Q/avr0tlIbN6FA==
Date: Mon, 8 Jul 2019 07:14:23 +0000
Message-ID: <SN6PR12MB28009F9FF6E7EC08A2BA2EDA87F60@SN6PR12MB2800.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f27dd247-567e-4f6c-db36-08d70373e7b0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2736; 
x-ms-traffictypediagnostic: SN6PR12MB2736:
x-microsoft-antispam-prvs: <SN6PR12MB273655B7F9E95679367A143587F60@SN6PR12MB2736.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:403;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(199004)(189003)(7736002)(8936002)(81166006)(53936002)(81156014)(72206003)(8676002)(74316002)(55016002)(9686003)(305945005)(14454004)(5640700003)(6916009)(66946007)(73956011)(76116006)(64756008)(2501003)(66556008)(66476007)(3846002)(26005)(6116002)(52536014)(2351001)(186003)(7696005)(66446008)(99286004)(6506007)(6436002)(68736007)(256004)(33656002)(25786009)(71190400001)(71200400001)(4326008)(66066001)(478600001)(316002)(476003)(486006)(5660300002)(86362001)(2906002)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2736;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Out3EpWA/boECSMOoK2hu8txIkITOHGCGODiP5IhujDVDQyb8WK/0LKw2sqi7yz8y28NnSva9a1UUQHrk/eVyCEr35SyYslmT8ixnXrBf1bSgpacNS8NgLLArNQPKOmn3vg5wVdmKUTQowoDgy6L+Lw4SLFlzJxU/eL7EqWFRONUOGcHCm5K2/EXxkUdbLGRIV9XugH+bhfyE/q0hxDa8h39pNBX5CqIl8tRvGmUvqhqrZytCwfVWcDAL3LMErepWH++iFRvp9kLPleVov7QovUUDVhI+f1s3URAMf4RhgC7WHbtW4yG3G8Nn0WiDeF9khecLgt5mvB1hSwv0CrV8Gxge/lrWMECDYWPWq9QeaqE0gEHWLOhmgTGBiIrSMzHkbxDK3GW0J9kcjBslwoul+1d7qC+/mMx/FU6eW9EtFE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f27dd247-567e-4f6c-db36-08d70373e7b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 07:14:23.8524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xpan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2736
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mM3lZVaQaFlqpkCB2rsOT6Uqbx/5ZXS3pZUARlSASTM=;
 b=sZ8/E0Lgbejb+mmBlnKMP4cvl9pcvYJ3VJzFgPPltIDpy1V/rO3MyNWYQURHdGAQ6vBI/ZT45BWsdFN3z8d80UpJ05Ib91FZbn1tEz4BF/kY6J9yr36PMPBeOrXPiVX8BhFgiD792ruj9FZF9ClPQUitOo6u9Z/zx0IMbVRKUxQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CldlIGFyZSBnb2luZyB0byBpbXBsZW1lbnQgcGVyLWlwIGVycm9yIGluamVjdGlvbiB0ZXN0cy4g
VGhpcyB0ZXN0CmFjdHVhbGx5IG9ubHkgd29ya3Mgb24gVU1DLgoKU2lnbmVkLW9mZi1ieTogeGlu
aHVpIHBhbiA8eGluaHVpLnBhbkBhbWQuY29tPgotLS0KIHRlc3RzL2FtZGdwdS9yYXNfdGVzdHMu
YyB8IDYyICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90
ZXN0cy9hbWRncHUvcmFzX3Rlc3RzLmMgYi90ZXN0cy9hbWRncHUvcmFzX3Rlc3RzLmMKaW5kZXgg
ODFjMzRhZDYuLmIzZDc5MDNkIDEwMDY0NAotLS0gYS90ZXN0cy9hbWRncHUvcmFzX3Rlc3RzLmMK
KysrIGIvdGVzdHMvYW1kZ3B1L3Jhc190ZXN0cy5jCkBAIC0zMTUsMTQgKzMxNSwxNCBAQCBpbnQg
c3VpdGVfcmFzX3Rlc3RzX2NsZWFuKHZvaWQpCiAKIHN0YXRpYyB2b2lkIGFtZGdwdV9yYXNfZGlz
YWJsZV90ZXN0KHZvaWQpOwogc3RhdGljIHZvaWQgYW1kZ3B1X3Jhc19lbmFibGVfdGVzdCh2b2lk
KTsKLXN0YXRpYyB2b2lkIGFtZGdwdV9yYXNfaW5qZWN0X3Rlc3Qodm9pZCk7CiBzdGF0aWMgdm9p
ZCBhbWRncHVfcmFzX3F1ZXJ5X3Rlc3Qodm9pZCk7CiBzdGF0aWMgdm9pZCBhbWRncHVfcmFzX2Jh
c2ljX3Rlc3Qodm9pZCk7CitzdGF0aWMgdm9pZCBhbWRncHVfcmFzX3VtY19pbmplY3RfdGVzdCh2
b2lkKTsKIAogQ1VfVGVzdEluZm8gcmFzX3Rlc3RzW10gPSB7CiAJeyAicmFzIGJhc2ljIHRlc3Qi
LAlhbWRncHVfcmFzX2Jhc2ljX3Rlc3QgfSwKIAl7ICJyYXMgcXVlcnkgdGVzdCIsCWFtZGdwdV9y
YXNfcXVlcnlfdGVzdCB9LAotCXsgInJhcyBpbmplY3QgdGVzdCIsCWFtZGdwdV9yYXNfaW5qZWN0
X3Rlc3QgfSwKKwl7ICJyYXMgdW1jIGluamVjdCB0ZXN0IixhbWRncHVfcmFzX3VtY19pbmplY3Rf
dGVzdCB9LAogCXsgInJhcyBkaXNhYmxlIHRlc3QiLAlhbWRncHVfcmFzX2Rpc2FibGVfdGVzdCB9
LAogI2lmIDAKIAl7ICJyYXMgZW5hYmxlIHRlc3QiLAlhbWRncHVfcmFzX2VuYWJsZV90ZXN0IH0s
CkBAIC01MDMsNTQgKzUwMyw1NSBAQCBzdGF0aWMgdm9pZCBhbWRncHVfcmFzX2VuYWJsZV90ZXN0
KHZvaWQpCiAJfQogfQogCi1zdGF0aWMgdm9pZCBfX2FtZGdwdV9yYXNfaW5qZWN0X3Rlc3Qodm9p
ZCkKK3N0YXRpYyB2b2lkIGFtZGdwdV9yYXNfdW1jX2luamVjdF90ZXN0KHZvaWQpCiB7CiAJc3Ry
dWN0IHJhc19kZWJ1Z19pZiBkYXRhOwogCWludCByZXQ7CiAJaW50IGk7CiAJdW5zaWduZWQgbG9u
ZyB1ZSwgY2UsIHVlX29sZCwgY2Vfb2xkOworCXN0cnVjdCByYXNfaW5qZWN0X2lmIGluamVjdCA9
IHsKKwkJLmhlYWQgPSB7CisJCQkuYmxvY2sgPSBBTURHUFVfUkFTX0JMT0NLX19VTUMsCisJCQku
dHlwZSA9IEFNREdQVV9SQVNfRVJST1JfX01VTFRJX1VOQ09SUkVDVEFCTEUsCisJCQkuc3ViX2Js
b2NrX2luZGV4ID0gMCwKKwkJCS5uYW1lID0gIiIsCisJCX0sCisJCS5hZGRyZXNzID0gMCwKKwkJ
LnZhbHVlID0gMCwKKwl9OworCWludCB0aW1lb3V0ID0gMzsKKwlpbnQgYmxvY2sgPSBBTURHUFVf
UkFTX0JMT0NLX19VTUM7CiAKKwlkYXRhLmluamVjdCA9IGluamVjdDsKIAlkYXRhLm9wID0gMjsK
LQlmb3IgKGkgPSAwOyBpIDwgQU1ER1BVX1JBU19CTE9DS19fTEFTVDsgaSsrKSB7Ci0JCWludCB0
aW1lb3V0ID0gMzsKLQkJc3RydWN0IHJhc19pbmplY3RfaWYgaW5qZWN0ID0gewotCQkJLmhlYWQg
PSB7Ci0JCQkJLmJsb2NrID0gaSwKLQkJCQkudHlwZSA9IEFNREdQVV9SQVNfRVJST1JfX01VTFRJ
X1VOQ09SUkVDVEFCTEUsCi0JCQkJLnN1Yl9ibG9ja19pbmRleCA9IDAsCi0JCQkJLm5hbWUgPSAi
IiwKLQkJCX0sCi0JCQkuYWRkcmVzcyA9IDAsCi0JCQkudmFsdWUgPSAwLAotCQl9OwogCi0JCWlm
IChhbWRncHVfcmFzX2lzX2ZlYXR1cmVfZW5hYmxlZChpKSA8PSAwKQotCQkJY29udGludWU7CisJ
Zm9yIChpID0gMDsgaSA8IGRldmljZXNfY291bnQ7IGkrKykgeworCQlzZXRfdGVzdF9jYXJkKGkp
OwogCi0JCWlmICghKCgxIDw8IGkpICYgcmFzX2Jsb2NrX21hc2tfaW5qZWN0KSkKLQkJCWNvbnRp
bnVlOworCQlpZiAoYW1kZ3B1X3Jhc19pc19mZWF0dXJlX2VuYWJsZWQoYmxvY2spIDw9IDApCisJ
CQlicmVhazsKIAotCQlkYXRhLmluamVjdCA9IGluamVjdDsKKwkJaWYgKCEoKDEgPDwgYmxvY2sp
ICYgcmFzX2Jsb2NrX21hc2tfaW5qZWN0KSkKKwkJCWJyZWFrOwogCi0JCXJldCA9IGFtZGdwdV9y
YXNfcXVlcnlfZXJyX2NvdW50KGksICZ1ZV9vbGQsICZjZV9vbGQpOworCQlyZXQgPSBhbWRncHVf
cmFzX3F1ZXJ5X2Vycl9jb3VudChibG9jaywgJnVlX29sZCwgJmNlX29sZCk7CiAJCUNVX0FTU0VS
VF9FUVVBTChyZXQsIDApOwogCiAJCWlmIChyZXQpCi0JCQljb250aW51ZTsKKwkJCWJyZWFrOwog
CiAJCXJldCA9IGFtZGdwdV9yYXNfaW52b2tlKCZkYXRhKTsKIAkJQ1VfQVNTRVJUX0VRVUFMKHJl
dCwgMCk7CiAKIAkJaWYgKHJldCkKLQkJCWNvbnRpbnVlOwotCisJCQlicmVhazsKIGxvb3A6CiAJ
CXdoaWxlICh0aW1lb3V0ID4gMCkgewotCQkJcmV0ID0gYW1kZ3B1X3Jhc19xdWVyeV9lcnJfY291
bnQoaSwgJnVlLCAmY2UpOworCQkJcmV0ID0gYW1kZ3B1X3Jhc19xdWVyeV9lcnJfY291bnQoYmxv
Y2ssICZ1ZSwgJmNlKTsKIAkJCUNVX0FTU0VSVF9FUVVBTChyZXQsIDApOwogCiAJCQlpZiAocmV0
KQotCQkJCWNvbnRpbnVlOworCQkJCWJyZWFrOwogCQkJaWYgKHVlX29sZCAhPSB1ZSkgewogCQkJ
CS8qcmVjb3ZlcnkgdGFrZXMgfjEwcyovCiAJCQkJc2xlZXAoMTApOwpAQCAtNTY2LDE1ICs1Njcs
NiBAQCBsb29wOgogCX0KIH0KIAotc3RhdGljIHZvaWQgYW1kZ3B1X3Jhc19pbmplY3RfdGVzdCh2
b2lkKQotewotCWludCBpOwotCWZvciAoaSA9IDA7IGkgPCBkZXZpY2VzX2NvdW50OyBpKyspIHsK
LQkJc2V0X3Rlc3RfY2FyZChpKTsKLQkJX19hbWRncHVfcmFzX2luamVjdF90ZXN0KCk7Ci0JfQot
fQotCiBzdGF0aWMgdm9pZCBfX2FtZGdwdV9yYXNfcXVlcnlfdGVzdCh2b2lkKQogewogCXVuc2ln
bmVkIGxvbmcgdWUsIGNlOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
