Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5B286242
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 14:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E256E4AF;
	Thu,  8 Aug 2019 12:51:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780053.outbound.protection.outlook.com [40.107.78.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F456E4AF
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 12:51:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wc9o+aNe7e6iwr+LaB1xFj+rHsBdcZq76H9AHJpTg7d0jerLErlRB+jQU/uj89oL2W/VDHPJtKnT0s7pfb3cnpi114XqlVA0cdHDa/7w9Ijw0zL/8X836Qfyv0YRz5bMmFQQjjVhhpdazE168Mo6RjBo+gRhWN1Cg7Vfs6uvnbyZc+rIOXw29f1Ge+fV393UNTdDqcTZv1NzOsQRtXMsjMUR7aCX3p20fF4ZeMLcPg/2i2snC/Hz4+y3co3w8qbtcPAi9M2FjU37lVogSDweYIn7cl8ExcwEXEMapW20Kw9d1u/tVbxhhvpWt5BkHaGV0MxRGOlJpmaG9ie7E2n8Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yb7f0RQBN0fGR0M7Yk+1NxBCYtTZpCMBaWbvfQzwBks=;
 b=lnbLKbbyxV/smzgRmbkIXwivt0FVWVSAxVVilO6Lx9wFOhRFeQFX24VO6+Fyv6wmxmJdrgTkZd1cve9z9h+cWrGlEHX2wxRfQ82b5psZGpy2u4cthDtHo03qaJDrIgh34SsVTJ6Y+LmKcFrt3CUIh9KDkPUGFSpUuMCAzUFmLx7aL6iyUjQl9l+NznMEviVlY9Xl1VvS2Sm1/vHF1Tr8tH+z4Xh6u+reG8E+GRRk1yRaH6U4WcgCkKIjd1EAuBSunJ+nYbCPvq+2h6Kg6HP9frtJKMqUNquE75pljS0vbsTb9dw5FpMB5n+6BzNwvsVuDnDtnGRKXdewwMKhQ7lcMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1508.namprd12.prod.outlook.com (10.172.23.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Thu, 8 Aug 2019 12:51:08 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::981d:64be:c32a:40d1]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::981d:64be:c32a:40d1%3]) with mapi id 15.20.2136.022; Thu, 8 Aug 2019
 12:51:08 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Zhou1, Tao"
 <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Freehill, Chris" <Chris.Freehill@amd.com>
Subject: RE: [PATCH] drm/amdgpu: update ras sysfs feature info
Thread-Topic: [PATCH] drm/amdgpu: update ras sysfs feature info
Thread-Index: AQHVS2RsJL6/+vVl0E+mRYBseGrEE6bsNPwAgAUDbSA=
Date: Thu, 8 Aug 2019 12:51:07 +0000
Message-ID: <BN6PR12MB16188930BC2E19E50B0EDB9185D70@BN6PR12MB1618.namprd12.prod.outlook.com>
References: <20190805080408.20770-1-tao.zhou1@amd.com>
 <DM5PR12MB14183A68E61B70184BEC459FFCDA0@DM5PR12MB1418.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB14183A68E61B70184BEC459FFCDA0@DM5PR12MB1418.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [72.142.94.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2dcaeda-5774-45bd-405d-08d71bff150f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1508; 
x-ms-traffictypediagnostic: BN6PR12MB1508:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB15083BAE87F9FAF617DAE73D85D70@BN6PR12MB1508.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:317;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(189003)(199004)(13464003)(2501003)(76116006)(305945005)(316002)(7736002)(66946007)(6246003)(64756008)(53936002)(25786009)(4326008)(74316002)(66446008)(66476007)(66556008)(110136005)(8936002)(66066001)(9686003)(81156014)(8676002)(81166006)(99286004)(5660300002)(55016002)(6306002)(229853002)(2906002)(6116002)(15650500001)(6636002)(3846002)(7696005)(446003)(11346002)(966005)(476003)(14454004)(26005)(71200400001)(71190400001)(186003)(76176011)(102836004)(6506007)(53546011)(52536014)(486006)(478600001)(256004)(14444005)(86362001)(33656002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1508;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Cp3l1lWHZtRb732QuajBNMkQKUvThIwm5NnFMqx1wlyWFF5a0GSG7UqscF9xAK/6mX3gJomZtpTGR/jDfEAjX7JbQeHMRsc7WChSs/6OTuLfDDcAE41OQxHEuoNNKjUq6dspkxDbaHclTDyE4IVG3edY999CLCW/JEmVuZfKgaqPnYV4SLWPegC2Bz8ONdcxpaMmeuBgY9qnYVoUUzIHn7hlCj8UO/dTt5GLmb7htdzxdjnuStHmoe2jY/Gg6EQy80xFM5RLY+YCWilFQb4CHt7/JQPDp4yDZZN2+02yMXnKFwC/mfWCNNDyC9BBzNoSbEcdIUNs/2Wcl/4FuYVjeCFlolt7PRMEgHF098KCQTxPwA5Ba0GMKvoiK5UsjvsU2dAvrfSCyqVyaEivuTx2+0vzrKmKIN2W+J3/QcWf7Nw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2dcaeda-5774-45bd-405d-08d71bff150f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 12:51:07.6652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krussell@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1508
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yb7f0RQBN0fGR0M7Yk+1NxBCYtTZpCMBaWbvfQzwBks=;
 b=mBPbuosSNFhJ1+SuqYPdF4aTOs2KE8SFk4Vc/0dnmWOBQgCvp0oDa6+fTofunBnIE7HC4hwPSGwdxfu/9wc5fa+zknij9HoGeBEd485s8r3al8gPH+MJFiZIWgIzazGtQiVPAp4n0G6N9Kfui3+9cPCpgQ03QsBL1jMocKElt6A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kent.Russell@amd.com; 
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

K0NocmlzIEZyZWVoaWxsDQoNCldoaWxlIEkgY2FuIHVuZGVyc3RhbmQgdGhpcyBjaGFuZ2UsIHRo
aXMgYnJva2Ugb3VyIFNNSSBpbnRlcmZhY2UsIHdoaWNoIHdhcyBleHBlY3RpbmcgYSBzcGVjaWZp
YyBzdHJpbmcgZm9ybWF0IGZvciB0aGUgcmFzL2ZlYXR1cmVzIGZpbGUuIFRoaXMgaGFzIGhhcHBl
bmVkIGEgZmV3IHRpbWVzIG5vdywgd2hlcmUgY2hhbmdlcyB0byB0aGUgUkFTIHN5c2ZzIGZpbGVz
IGhhcyBicm9rZSB0aGUgU01JIENMSSBhbmQvb3IgU01JIExJQi4gQ2FuIHdlIHBsZWFzZSBnZXQg
YSBzdGFibGUgaW50ZXJmYWNlIGFuZCBzeXNmcyBmb3JtYXQgc2V0IHVwIGJlZm9yZSBwdWJsaXNo
aW5nIHBhdGNoZXM/IFRoaXMgaXMgY3JlYXRpbmcgYSBsb3Qgb2YgZXh0cmEgd29yayBmb3IgZGV2
ZWxvcGVycyB3aXRoIHRoZSBTTUkgdG8gY29uc3RhbnRseSBrZWVwIHVwIHdpdGggdGhlIGNoYW5n
ZXMgYmVpbmcgbWFkZSB0byBzeXNmcyBmaWxlcy4gVGhhbmsgeW91Lg0KDQogS2VudA0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFpoYW5nLCBIYXdraW5nDQpTZW50OiBN
b25kYXksIEF1Z3VzdCA1LCAyMDE5IDQ6MTUgQU0NClRvOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFA
YW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBQYW4sIFhpbmh1aSA8WGlu
aHVpLlBhbkBhbWQuY29tPg0KQ2M6IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPg0KU3Vi
amVjdDogUkU6IFtQQVRDSF0gZHJtL2FtZGdwdTogdXBkYXRlIHJhcyBzeXNmcyBmZWF0dXJlIGlu
Zm8NCg0KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4N
Cg0KUmVnYXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBh
bWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYg
T2YgVGFvIFpob3UNClNlbnQ6IDIwMTnlubQ45pyINeaXpSAxNjowNA0KVG86IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsgWmhh
bmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCkNjOiBaaG91MSwgVGFvIDxUYW8u
WmhvdTFAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogdXBkYXRlIHJhcyBz
eXNmcyBmZWF0dXJlIGluZm8NCg0KcmVtb3ZlIGNvbmZ1c2VkIHJhcyBlcnJvciB0eXBlIGluZm8N
Cg0KU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPg0KLS0tDQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMTcgKysrKystLS0tLS0tLS0t
LS0NCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KaW5kZXggZDJlOGE4NWY2ZTM4
Li4zNjk2NTEyNDdiMjMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
Yw0KQEAgLTc4NywyNSArNzg3LDE4IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9yYXNfc3lzZnNf
ZmVhdHVyZXNfcmVhZChzdHJ1Y3QgZGV2aWNlICpkZXYsDQogCXN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2ID0gZGRldi0+ZGV2X3ByaXZhdGU7DQogCXN0cnVjdCByYXNfY29tbW9uX2lmIGhlYWQ7
DQogCWludCByYXNfYmxvY2tfY291bnQgPSBBTURHUFVfUkFTX0JMT0NLX0NPVU5UOw0KLQlpbnQg
aTsNCisJaW50IGksIGVuYWJsZWQ7DQogCXNzaXplX3QgczsNCi0Jc3RydWN0IHJhc19tYW5hZ2Vy
ICpvYmo7DQogDQogCXMgPSBzY25wcmludGYoYnVmLCBQQUdFX1NJWkUsICJmZWF0dXJlIG1hc2s6
IDB4JXhcbiIsIGNvbi0+ZmVhdHVyZXMpOw0KIA0KIAlmb3IgKGkgPSAwOyBpIDwgcmFzX2Jsb2Nr
X2NvdW50OyBpKyspIHsNCiAJCWhlYWQuYmxvY2sgPSBpOw0KKwkJZW5hYmxlZCA9IGFtZGdwdV9y
YXNfaXNfZmVhdHVyZV9lbmFibGVkKGFkZXYsICZoZWFkKTsNCiANCi0JCWlmIChhbWRncHVfcmFz
X2lzX2ZlYXR1cmVfZW5hYmxlZChhZGV2LCAmaGVhZCkpIHsNCi0JCQlvYmogPSBhbWRncHVfcmFz
X2ZpbmRfb2JqKGFkZXYsICZoZWFkKTsNCi0JCQlzICs9IHNjbnByaW50ZigmYnVmW3NdLCBQQUdF
X1NJWkUgLSBzLA0KLQkJCQkJIiVzOiAlc1xuIiwNCi0JCQkJCXJhc19ibG9ja19zdHIoaSksDQot
CQkJCQlyYXNfZXJyX3N0cihvYmotPmhlYWQudHlwZSkpOw0KLQkJfSBlbHNlDQotCQkJcyArPSBz
Y25wcmludGYoJmJ1ZltzXSwgUEFHRV9TSVpFIC0gcywNCi0JCQkJCSIlczogZGlzYWJsZWRcbiIs
DQotCQkJCQlyYXNfYmxvY2tfc3RyKGkpKTsNCisJCXMgKz0gc2NucHJpbnRmKCZidWZbc10sIFBB
R0VfU0laRSAtIHMsDQorCQkJCSIlcyByYXMgZmVhdHVyZSBtYXNrOiAlc1xuIiwNCisJCQkJcmFz
X2Jsb2NrX3N0cihpKSwgZW5hYmxlZD8ib24iOiJvZmYiKTsNCiAJfQ0KIA0KIAlyZXR1cm4gczsN
Ci0tIA0KMi4xNy4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1n
ZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
