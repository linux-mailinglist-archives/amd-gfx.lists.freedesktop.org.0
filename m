Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023DB175737
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Mar 2020 10:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711966E207;
	Mon,  2 Mar 2020 09:35:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::60c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420A46E207
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Mar 2020 09:35:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/u9lgP5CAVZdgNIg60MZXw1HNacWrwxjUXcV23d+qPnnbKS8B2Uao9s2rEExq2Lkf1Jbkl3y3zK75YcPSeb7BBee8SgGcy4aMzU3i2I/ptIEfRRgG+LqluHrXc/rwFnuIEWeDd+3XR1od7IXrIvXRXMHh3LW/OupYexzzXQ8PNFyJVC6DtUOX5VvtGw2u00x5JwIYymCZ2YBGiMn00jTxNoab2al4WgqL16whOV5DsbJfci8aRuFo7bt8qclNrvBidhSTJjBS40SzgH5pR1Zm5dwtSiUHFTUyFz+kSEmXIPLnaZwGviWUaZ+3N0jm4817n/Jr0Ynb3JLOXI4t/k2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3TT9t2V/FLMo3fHwD26/zW8FfqIexDSv874x9Ygd/I=;
 b=Rx2ok2kaWjxiOToIpA1hWnvSI6gshwCxNG0kXtj2HZlkQF3nhpuF2bn0aECS2hp2fsOrJhXapWQhYrMpKrR7NHwcnJ2la0qC9jUeDPTr2SWbyXZttLFrRW2V0hnsozd5DrJuSYmDP1TcuSy2DnYO9zqhbMznWV6GNg8Rl2hA/aLydI0nYAWUYF9yRAohFTEGZ4FeSdIkUBH+WSepjzLObthDZ+BmMaDEqUxT3LtsQwHYE47hrbxWZlZT9shYAsquq8GArDjXpgkCZ4q/7PF4ChJnDq+VoOCJzCRnBg9ogYK9j3dLBsbUXMM5SPJvoQGDTTC0+upKfRdggmCpkxzzWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3TT9t2V/FLMo3fHwD26/zW8FfqIexDSv874x9Ygd/I=;
 b=viLkz7emBZu9jZVyU14AckJWcnkpu0foUOrThae1jOHz7pv5RI4NLyvOZVRMpzlEpFYdUQJZLMRtdt1Rd/kyV7eOjYD1Lub8QUrqIUjucooa2dM7vknPc1R5czw/Hn/9ZeyRfgAy9FLFfvMeJUOEx1/BD3DA8awGZRJ5TuHJrVo=
Received: from MN2PR12MB3933.namprd12.prod.outlook.com (2603:10b6:208:162::18)
 by MN2PR12MB3949.namprd12.prod.outlook.com (2603:10b6:208:167::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.18; Mon, 2 Mar
 2020 09:35:07 +0000
Received: from MN2PR12MB3933.namprd12.prod.outlook.com
 ([fe80::4905:91cf:ae95:6ffb]) by MN2PR12MB3933.namprd12.prod.outlook.com
 ([fe80::4905:91cf:ae95:6ffb%7]) with mapi id 15.20.2772.019; Mon, 2 Mar 2020
 09:35:07 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Xu, Feifei" <Feifei.Xu@amd.com>, "Yin, Tianci (Rico)"
 <Tianci.Yin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: disable 3D pipe 1 on Navi1x
Thread-Topic: [PATCH] drm/amdgpu: disable 3D pipe 1 on Navi1x
Thread-Index: AQHV8DXuz0lG/hnPYUC3Qmvyou1jnqg1CoGAgAAAs1A=
Date: Mon, 2 Mar 2020 09:35:07 +0000
Message-ID: <MN2PR12MB3933E900710ED92A0F80E93E84E70@MN2PR12MB3933.namprd12.prod.outlook.com>
References: <20200302015713.14355-1-tianci.yin@amd.com>
 <CH2PR12MB376760616A6D5482F486FFDAFEE70@CH2PR12MB3767.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB376760616A6D5482F486FFDAFEE70@CH2PR12MB3767.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-03-02T09:32:14Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=b47b880f-ce22-474b-96ed-0000155bbcd6;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Monk.Liu@amd.com; 
x-originating-ip: [180.167.199.182]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f6043a5c-795b-4a2e-cb79-08d7be8cfefe
x-ms-traffictypediagnostic: MN2PR12MB3949:|MN2PR12MB3949:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB39498999009B616F220E499A84E70@MN2PR12MB3949.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:758;
x-forefront-prvs: 033054F29A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(189003)(199004)(66946007)(66476007)(52536014)(4326008)(64756008)(66446008)(66556008)(2906002)(86362001)(478600001)(9686003)(966005)(55016002)(71200400001)(76116006)(33656002)(45080400002)(5660300002)(8676002)(53546011)(7696005)(54906003)(8936002)(81166006)(81156014)(6506007)(316002)(26005)(186003)(110136005)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3949;
 H:MN2PR12MB3933.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FeCrrB4JO9ray2LPhLWev37BLSA8qcieastKrbuwNDqxWUM0zBOB/noe85o3gEyRMrIEGih/6+Uoapmraa8TiAHWcOOoOSmPYuHO8El0BiXom3/2gNZQfeN2LCRx4aRY8YFzBTaoXO4a35SQ+lt2i9GiyN2RSuSUrUD3G7GvY+ZX2HTvz4IoyHVDz8tK1QdYn3t+PJkbsut1Hu+dCY6UpuXOwTuZB/zFT/pKEQUBFXGNYhYqA03SdCnhXYPeeg5BHNuIs1u4eba0EINvLpVSz/8pe3xf7Hxz5CLbCrIrLJhuXRt6Mi+NowDXeS8uEyadBH4uMlEPVha4ZQbfjYGkyPHeNp3yaHby3R51lHsVHN/9b7MIgLOPvVKdPtjZGb2xjUhUgeZ1n7oxZAXvfk1H+NezfMtRsv2s8pI567+MY81GgVSGrj4JUm0JR185zn61i6xc/QHTCDLfLfxdyi/htJqD28UOclboTT1cpToppRHkHYebX8cin1AWlfCZSHamHfxfvHE+kdcIHKdZntRltQ==
x-ms-exchange-antispam-messagedata: qGKsOQnMv6iyCyoMileEg5T+WDtLrF/7DG0mf72CdasGTrPFxQ6fZftwThoea2qmCq3I/4gF6IBZDn6a+wceRtL1SOA6m0ABv3AuUoRbhqN/0TkhkRD6pelI8yYdGQl3GZNowEfcY9IefvCy/4fZNw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6043a5c-795b-4a2e-cb79-08d7be8cfefe
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2020 09:35:07.7835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ts2l6Uj8a3CpbUxDIWMXx50qJjdTH2L7Wlzs//fEHyoWXI7nAnesKLGF0nUBeYHd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3949
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Long, Gang" <Gang.Long@amd.com>, "Li, Pauline" <Pauline.Li@amd.com>, "Yin,
 Tianci \(Rico\)" <Tianci.Yin@amd.com>, "Gao, Likun" <Likun.Gao@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IE1vbmsgTGl1IDxtb25rLmxpdUBhbWQuY29tPg0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQpNb25rIExpdXxHUFUgVmlydHVhbGl6YXRpb24gVGVh
bSB8QU1EDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFt
ZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBYdSwgRmVp
ZmVpDQpTZW50OiBNb25kYXksIE1hcmNoIDIsIDIwMjAgNTozMiBQTQ0KVG86IFlpbiwgVGlhbmNp
IChSaWNvKSA8VGlhbmNpLllpbkBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCkNjOiBMb25nLCBHYW5nIDxHYW5nLkxvbmdAYW1kLmNvbT47IExpLCBQYXVsaW5lIDxQYXVs
aW5lLkxpQGFtZC5jb20+OyBZaW4sIFRpYW5jaSAoUmljbykgPFRpYW5jaS5ZaW5AYW1kLmNvbT47
IEdhbywgTGlrdW4gPExpa3VuLkdhb0BhbWQuY29tPjsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcu
WmhhbmdAYW1kLmNvbT47IFl1YW4sIFhpYW9qaWUgPFhpYW9qaWUuWXVhbkBhbWQuY29tPg0KU3Vi
amVjdDogUkU6IFtQQVRDSF0gZHJtL2FtZGdwdTogZGlzYWJsZSAzRCBwaXBlIDEgb24gTmF2aTF4
DQoNCltBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KDQoNClJldmlld2VkLWJ5OiBGZWlmZWkgWHUgPEZlaWZlaS5YdUBhbWQuY29tPg0KDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBUaWFuY2kgWWluIDx0aWFuY2kueWluQGFt
ZC5jb20+IA0KU2VudDogMjAyMMTqM9TCMsjVIDk6NTcNClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KQ2M6IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBY
dSwgRmVpZmVpIDxGZWlmZWkuWHVAYW1kLmNvbT47IEdhbywgTGlrdW4gPExpa3VuLkdhb0BhbWQu
Y29tPjsgWXVhbiwgWGlhb2ppZSA8WGlhb2ppZS5ZdWFuQGFtZC5jb20+OyBMb25nLCBHYW5nIDxH
YW5nLkxvbmdAYW1kLmNvbT47IExpLCBQYXVsaW5lIDxQYXVsaW5lLkxpQGFtZC5jb20+OyBZaW4s
IFRpYW5jaSAoUmljbykgPFRpYW5jaS5ZaW5AYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gZHJt
L2FtZGdwdTogZGlzYWJsZSAzRCBwaXBlIDEgb24gTmF2aTF4DQoNCkZyb206ICJUaWFuY2kuWWlu
IiA8dGlhbmNpLnlpbkBhbWQuY29tPg0KDQpbd2h5XQ0KQ1AgZmlybXdhcmUgZGVjaWRlIHRvIHNr
aXAgc2V0dGluZyB0aGUgc3RhdGUgZm9yIDNEIHBpcGUgMSBmb3IgTmF2aTF4IGFzIHRoZXJlIGlz
IG5vIHVzZSBjYXNlLg0KDQpbaG93XQ0KRGlzYWJsZSAzRCBwaXBlIDEgb24gTmF2aTF4Lg0KDQpD
aGFuZ2UtSWQ6IEk2ODk4YmRmZTMxZDRlNzkwOGJkOWJjZmE4MmI2YTc1ZTExOGU4NzI3DQpSZXZp
ZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KU2lnbmVkLW9m
Zi1ieTogVGlhbmNpLllpbiA8dGlhbmNpLnlpbkBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgfCA5NyArKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LQ0KIDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCA0NiBkZWxldGlvbnMoLSkNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMNCmluZGV4IDc2MGZlMmViZTc5OS4u
ZjM0ODUxMmViOGMzIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
X3YxMF8wLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jDQpA
QCAtNTIsNyArNTIsNyBAQA0KICAqIDEuIFByaW1hcnkgcmluZw0KICAqIDIuIEFzeW5jIHJpbmcN
CiAgKi8NCi0jZGVmaW5lIEdGWDEwX05VTV9HRlhfUklOR1MJMg0KKyNkZWZpbmUgR0ZYMTBfTlVN
X0dGWF9SSU5HU19OVjFYCTENCiAjZGVmaW5lIEdGWDEwX01FQ19IUERfU0laRQkyMDQ4DQogDQog
I2RlZmluZSBGMzJfQ0VfUFJPR1JBTV9SQU1fU0laRQkJNjU1MzYNCkBAIC0xMzA1LDcgKzEzMDUs
NyBAQCBzdGF0aWMgaW50IGdmeF92MTBfMF9zd19pbml0KHZvaWQgKmhhbmRsZSkNCiAJY2FzZSBD
SElQX05BVkkxNDoNCiAJY2FzZSBDSElQX05BVkkxMjoNCiAJCWFkZXYtPmdmeC5tZS5udW1fbWUg
PSAxOw0KLQkJYWRldi0+Z2Z4Lm1lLm51bV9waXBlX3Blcl9tZSA9IDI7DQorCQlhZGV2LT5nZngu
bWUubnVtX3BpcGVfcGVyX21lID0gMTsNCiAJCWFkZXYtPmdmeC5tZS5udW1fcXVldWVfcGVyX3Bp
cGUgPSAxOw0KIAkJYWRldi0+Z2Z4Lm1lYy5udW1fbWVjID0gMjsNCiAJCWFkZXYtPmdmeC5tZWMu
bnVtX3BpcGVfcGVyX21lYyA9IDQ7DQpAQCAtMjcxMSwxOCArMjcxMSwyMCBAQCBzdGF0aWMgaW50
IGdmeF92MTBfMF9jcF9nZnhfc3RhcnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogCWFt
ZGdwdV9yaW5nX2NvbW1pdChyaW5nKTsNCiANCiAJLyogc3VibWl0IGNzIHBhY2tldCB0byBjb3B5
IHN0YXRlIDAgdG8gbmV4dCBhdmFpbGFibGUgc3RhdGUgKi8NCi0JcmluZyA9ICZhZGV2LT5nZngu
Z2Z4X3JpbmdbMV07DQotCXIgPSBhbWRncHVfcmluZ19hbGxvYyhyaW5nLCAyKTsNCi0JaWYgKHIp
IHsNCi0JCURSTV9FUlJPUigiYW1kZ3B1OiBjcCBmYWlsZWQgdG8gbG9jayByaW5nICglZCkuXG4i
LCByKTsNCi0JCXJldHVybiByOw0KLQl9DQotDQotCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBB
Q0tFVDMoUEFDS0VUM19DTEVBUl9TVEFURSwgMCkpOw0KLQlhbWRncHVfcmluZ193cml0ZShyaW5n
LCAwKTsNCisJaWYgKGFkZXYtPmdmeC5udW1fZ2Z4X3JpbmdzID4gMSkgew0KKwkJLyogbWF4aW11
bSBzdXBwb3J0ZWQgZ2Z4IHJpbmcgaXMgMiAqLw0KKwkJcmluZyA9ICZhZGV2LT5nZnguZ2Z4X3Jp
bmdbMV07DQorCQlyID0gYW1kZ3B1X3JpbmdfYWxsb2MocmluZywgMik7DQorCQlpZiAocikgew0K
KwkJCURSTV9FUlJPUigiYW1kZ3B1OiBjcCBmYWlsZWQgdG8gbG9jayByaW5nICglZCkuXG4iLCBy
KTsNCisJCQlyZXR1cm4gcjsNCisJCX0NCiANCi0JYW1kZ3B1X3JpbmdfY29tbWl0KHJpbmcpOw0K
KwkJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgUEFDS0VUMyhQQUNLRVQzX0NMRUFSX1NUQVRFLCAw
KSk7DQorCQlhbWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsNCiANCisJCWFtZGdwdV9yaW5nX2Nv
bW1pdChyaW5nKTsNCisJfQ0KIAlyZXR1cm4gMDsNCiB9DQogDQpAQCAtMjgxOSwzOSArMjgyMSw0
MSBAQCBzdGF0aWMgaW50IGdmeF92MTBfMF9jcF9nZnhfcmVzdW1lKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQ0KIAltdXRleF91bmxvY2soJmFkZXYtPnNyYm1fbXV0ZXgpOw0KIA0KIAkvKiBJ
bml0IGdmeCByaW5nIDEgZm9yIHBpcGUgMSAqLw0KLQltdXRleF9sb2NrKCZhZGV2LT5zcmJtX211
dGV4KTsNCi0JZ2Z4X3YxMF8wX2NwX2dmeF9zd2l0Y2hfcGlwZShhZGV2LCBQSVBFX0lEMSk7DQot
CXJpbmcgPSAmYWRldi0+Z2Z4LmdmeF9yaW5nWzFdOw0KLQlyYl9idWZzeiA9IG9yZGVyX2Jhc2Vf
MihyaW5nLT5yaW5nX3NpemUgLyA4KTsNCi0JdG1wID0gUkVHX1NFVF9GSUVMRCgwLCBDUF9SQjFf
Q05UTCwgUkJfQlVGU1osIHJiX2J1ZnN6KTsNCi0JdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIENQ
X1JCMV9DTlRMLCBSQl9CTEtTWiwgcmJfYnVmc3ogLSAyKTsNCi0JV1JFRzMyX1NPQzE1KEdDLCAw
LCBtbUNQX1JCMV9DTlRMLCB0bXApOw0KLQkvKiBJbml0aWFsaXplIHRoZSByaW5nIGJ1ZmZlcidz
IHdyaXRlIHBvaW50ZXJzICovDQotCXJpbmctPndwdHIgPSAwOw0KLQlXUkVHMzJfU09DMTUoR0Ms
IDAsIG1tQ1BfUkIxX1dQVFIsIGxvd2VyXzMyX2JpdHMocmluZy0+d3B0cikpOw0KLQlXUkVHMzJf
U09DMTUoR0MsIDAsIG1tQ1BfUkIxX1dQVFJfSEksIHVwcGVyXzMyX2JpdHMocmluZy0+d3B0cikp
Ow0KLQkvKiBTZXQgdGhlIHdiIGFkZHJlc3Mgd2V0aGVyIGl0J3MgZW5hYmxlZCBvciBub3QgKi8N
Ci0JcnB0cl9hZGRyID0gYWRldi0+d2IuZ3B1X2FkZHIgKyAocmluZy0+cnB0cl9vZmZzICogNCk7
DQotCVdSRUczMl9TT0MxNShHQywgMCwgbW1DUF9SQjFfUlBUUl9BRERSLCBsb3dlcl8zMl9iaXRz
KHJwdHJfYWRkcikpOw0KLQlXUkVHMzJfU09DMTUoR0MsIDAsIG1tQ1BfUkIxX1JQVFJfQUREUl9I
SSwgdXBwZXJfMzJfYml0cyhycHRyX2FkZHIpICYNCi0JCUNQX1JCMV9SUFRSX0FERFJfSElfX1JC
X1JQVFJfQUREUl9ISV9NQVNLKTsNCi0Jd3B0cl9ncHVfYWRkciA9IGFkZXYtPndiLmdwdV9hZGRy
ICsgKHJpbmctPndwdHJfb2ZmcyAqIDQpOw0KLQlXUkVHMzJfU09DMTUoR0MsIDAsIG1tQ1BfUkJf
V1BUUl9QT0xMX0FERFJfTE8sDQotCQlsb3dlcl8zMl9iaXRzKHdwdHJfZ3B1X2FkZHIpKTsNCi0J
V1JFRzMyX1NPQzE1KEdDLCAwLCBtbUNQX1JCX1dQVFJfUE9MTF9BRERSX0hJLA0KLQkJdXBwZXJf
MzJfYml0cyh3cHRyX2dwdV9hZGRyKSk7DQotDQotCW1kZWxheSgxKTsNCi0JV1JFRzMyX1NPQzE1
KEdDLCAwLCBtbUNQX1JCMV9DTlRMLCB0bXApOw0KLQ0KLQlyYl9hZGRyID0gcmluZy0+Z3B1X2Fk
ZHIgPj4gODsNCi0JV1JFRzMyX1NPQzE1KEdDLCAwLCBtbUNQX1JCMV9CQVNFLCByYl9hZGRyKTsN
Ci0JV1JFRzMyX1NPQzE1KEdDLCAwLCBtbUNQX1JCMV9CQVNFX0hJLCB1cHBlcl8zMl9iaXRzKHJi
X2FkZHIpKTsNCi0JV1JFRzMyX1NPQzE1KEdDLCAwLCBtbUNQX1JCMV9BQ1RJVkUsIDEpOw0KLQ0K
LQlnZnhfdjEwXzBfY3BfZ2Z4X3NldF9kb29yYmVsbChhZGV2LCByaW5nKTsNCi0JbXV0ZXhfdW5s
b2NrKCZhZGV2LT5zcmJtX211dGV4KTsNCi0NCisJaWYgKGFkZXYtPmdmeC5udW1fZ2Z4X3Jpbmdz
ID4gMSkgew0KKwkJbXV0ZXhfbG9jaygmYWRldi0+c3JibV9tdXRleCk7DQorCQlnZnhfdjEwXzBf
Y3BfZ2Z4X3N3aXRjaF9waXBlKGFkZXYsIFBJUEVfSUQxKTsNCisJCS8qIG1heGltdW0gc3VwcG9y
dGVkIGdmeCByaW5nIGlzIDIgKi8NCisJCXJpbmcgPSAmYWRldi0+Z2Z4LmdmeF9yaW5nWzFdOw0K
KwkJcmJfYnVmc3ogPSBvcmRlcl9iYXNlXzIocmluZy0+cmluZ19zaXplIC8gOCk7DQorCQl0bXAg
PSBSRUdfU0VUX0ZJRUxEKDAsIENQX1JCMV9DTlRMLCBSQl9CVUZTWiwgcmJfYnVmc3opOw0KKwkJ
dG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIENQX1JCMV9DTlRMLCBSQl9CTEtTWiwgcmJfYnVmc3og
LSAyKTsNCisJCVdSRUczMl9TT0MxNShHQywgMCwgbW1DUF9SQjFfQ05UTCwgdG1wKTsNCisJCS8q
IEluaXRpYWxpemUgdGhlIHJpbmcgYnVmZmVyJ3Mgd3JpdGUgcG9pbnRlcnMgKi8NCisJCXJpbmct
PndwdHIgPSAwOw0KKwkJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbUNQX1JCMV9XUFRSLCBsb3dlcl8z
Ml9iaXRzKHJpbmctPndwdHIpKTsNCisJCVdSRUczMl9TT0MxNShHQywgMCwgbW1DUF9SQjFfV1BU
Ul9ISSwgdXBwZXJfMzJfYml0cyhyaW5nLT53cHRyKSk7DQorCQkvKiBTZXQgdGhlIHdiIGFkZHJl
c3Mgd2V0aGVyIGl0J3MgZW5hYmxlZCBvciBub3QgKi8NCisJCXJwdHJfYWRkciA9IGFkZXYtPndi
LmdwdV9hZGRyICsgKHJpbmctPnJwdHJfb2ZmcyAqIDQpOw0KKwkJV1JFRzMyX1NPQzE1KEdDLCAw
LCBtbUNQX1JCMV9SUFRSX0FERFIsIGxvd2VyXzMyX2JpdHMocnB0cl9hZGRyKSk7DQorCQlXUkVH
MzJfU09DMTUoR0MsIDAsIG1tQ1BfUkIxX1JQVFJfQUREUl9ISSwgdXBwZXJfMzJfYml0cyhycHRy
X2FkZHIpICYNCisJCQkgICAgIENQX1JCMV9SUFRSX0FERFJfSElfX1JCX1JQVFJfQUREUl9ISV9N
QVNLKTsNCisJCXdwdHJfZ3B1X2FkZHIgPSBhZGV2LT53Yi5ncHVfYWRkciArIChyaW5nLT53cHRy
X29mZnMgKiA0KTsNCisJCVdSRUczMl9TT0MxNShHQywgMCwgbW1DUF9SQl9XUFRSX1BPTExfQURE
Ul9MTywNCisJCQkgICAgIGxvd2VyXzMyX2JpdHMod3B0cl9ncHVfYWRkcikpOw0KKwkJV1JFRzMy
X1NPQzE1KEdDLCAwLCBtbUNQX1JCX1dQVFJfUE9MTF9BRERSX0hJLA0KKwkJCSAgICAgdXBwZXJf
MzJfYml0cyh3cHRyX2dwdV9hZGRyKSk7DQorDQorCQltZGVsYXkoMSk7DQorCQlXUkVHMzJfU09D
MTUoR0MsIDAsIG1tQ1BfUkIxX0NOVEwsIHRtcCk7DQorDQorCQlyYl9hZGRyID0gcmluZy0+Z3B1
X2FkZHIgPj4gODsNCisJCVdSRUczMl9TT0MxNShHQywgMCwgbW1DUF9SQjFfQkFTRSwgcmJfYWRk
cik7DQorCQlXUkVHMzJfU09DMTUoR0MsIDAsIG1tQ1BfUkIxX0JBU0VfSEksIHVwcGVyXzMyX2Jp
dHMocmJfYWRkcikpOw0KKwkJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbUNQX1JCMV9BQ1RJVkUsIDEp
Ow0KKw0KKwkJZ2Z4X3YxMF8wX2NwX2dmeF9zZXRfZG9vcmJlbGwoYWRldiwgcmluZyk7DQorCQlt
dXRleF91bmxvY2soJmFkZXYtPnNyYm1fbXV0ZXgpOw0KKwl9DQogCS8qIFN3aXRjaCB0byBwaXBl
IDAgKi8NCiAJbXV0ZXhfbG9jaygmYWRldi0+c3JibV9tdXRleCk7DQogCWdmeF92MTBfMF9jcF9n
Znhfc3dpdGNoX3BpcGUoYWRldiwgUElQRV9JRDApOyBAQCAtMzk2Nyw3ICszOTcxLDggQEAgc3Rh
dGljIGludCBnZnhfdjEwXzBfZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpICB7DQogCXN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOw0KIA0K
LQlhZGV2LT5nZngubnVtX2dmeF9yaW5ncyA9IEdGWDEwX05VTV9HRlhfUklOR1M7DQorCWFkZXYt
PmdmeC5udW1fZ2Z4X3JpbmdzID0gR0ZYMTBfTlVNX0dGWF9SSU5HU19OVjFYOw0KKw0KIAlhZGV2
LT5nZngubnVtX2NvbXB1dGVfcmluZ3MgPSBBTURHUFVfTUFYX0NPTVBVVEVfUklOR1M7DQogDQog
CWdmeF92MTBfMF9zZXRfa2lxX3BtNF9mdW5jcyhhZGV2KTsNCi0tDQoyLjE3LjENCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcg
bGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbmFtMTEuc2FmZWxp
bmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVk
ZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmFtZC1nZngmYW1wO2RhdGE9MDIlN0Mw
MSU3Q21vbmsubGl1JTQwYW1kLmNvbSU3Qzc2YjZjYjY4Yzg1MjRlMjRhNzFhMDhkN2JlOGM5Yjkx
JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzE4NzM4MzQ2
NTA2OTAzOSZhbXA7c2RhdGE9NUNZeW9yeUZGYUR3R0V1QiUyRjFqeUk1RnVaQ00ya003aFVLRDJP
dUtOJTJCaFUlM0QmYW1wO3Jlc2VydmVkPTANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeAo=
