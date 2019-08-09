Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CF4870B8
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 06:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6686ECFC;
	Fri,  9 Aug 2019 04:41:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730081.outbound.protection.outlook.com [40.107.73.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39ADC6ECFC
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 04:41:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzP/4YbIFRnnh7Bs5h/2ScBpSC0jvJUrf+Oo6HLI+DucTWPy8PtXwopblv3pqxNpGnMNmwOdCTqNQ8cIOlwLGYjUiO9+yJ6n+gGzmq0MCi1ZHbuUiG1UQAX8DwyeFd8Wbw4tLl8X4j7gWO3s+dNS6dsoy2Yzpdttl8YRXA2ZVhy5jcdFXgct30ZwCqS67eTWeXAaH+Z3rRcdGP9xLzVmH/bt65BCk3Q/f1Umyf+DD2sOygrjZ3IhlPWi+BVpy2+wXrS7F16j3/TL7vcJOpcH86hxf7oVLRiw99UaX2lTGqa5Q+8WMJLD9MJEFW4P3lbvbtGWaJa7hx0FvT2rMPl4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rp/8pMQLnWKScDEvt40xFmnzLVNrXn+b4Gsn7tupI0I=;
 b=mfAOdo9Aj9oJnaXAcAAP2JfSckHTAy3/+Phg7ttRSf8uZdMNpEcyIbotWAogl+3x3dxtqFmeHgDs3JQwxU5AV/q19yerJlzARMvohWNKEX7eKXqDhasvbYzh3ExWWD9+eQfbGj2lEy/opYG1tHA70UUjL0JjfDYfZDra4AVMuuvPU+4Z4pPE0ktGut1ZY3ks2G/Wn91X/BqTOCg1Ohrl21KkNfhl7JqeI4JcR0XGGVsscPTFQWgkzaWGbt5Er6vpwvLgNzyFzzrAduPnv6dpf6N3efZkC7TtwtPg23F3UADSEEVh8moRIaiBRqiIblKRJmCeBrLUznowi7GFK+SCIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1753.namprd12.prod.outlook.com (10.175.88.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Fri, 9 Aug 2019 04:41:15 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e%3]) with mapi id 15.20.2136.018; Fri, 9 Aug 2019
 04:41:15 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: RE: [PATCH 2/2] drm/amdgpu: remove RREG64/WREG64
Thread-Topic: [PATCH 2/2] drm/amdgpu: remove RREG64/WREG64
Thread-Index: AQHVTmrtQvhzYodfEk6UyiwDTV2U6qbyPGBQ
Date: Fri, 9 Aug 2019 04:41:15 +0000
Message-ID: <DM5PR12MB141830FE4348F67C4B67ED96FCD60@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190809042731.30491-1-tao.zhou1@amd.com>
 <20190809042731.30491-2-tao.zhou1@amd.com>
In-Reply-To: <20190809042731.30491-2-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08ebfac8-e1e6-483c-ba8b-08d71c83d060
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1753; 
x-ms-traffictypediagnostic: DM5PR12MB1753:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1753AB7A6FD0D927BC8B72A3FCD60@DM5PR12MB1753.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:595;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(13464003)(189003)(199004)(6306002)(86362001)(76116006)(4326008)(55016002)(14454004)(25786009)(66946007)(53936002)(66476007)(66556008)(52536014)(5660300002)(8676002)(6246003)(6636002)(2501003)(476003)(66446008)(11346002)(6506007)(74316002)(81166006)(478600001)(53546011)(446003)(305945005)(81156014)(6436002)(7736002)(6116002)(110136005)(3846002)(33656002)(316002)(256004)(64756008)(9686003)(102836004)(26005)(486006)(966005)(8936002)(66066001)(7696005)(99286004)(186003)(229853002)(71200400001)(2906002)(76176011)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1753;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 91KH21j63WDRsxKVKDlpCkgCyv3v4bQ0a6auDLiBQZqz3s5+uYOU6i1CIe8/P+JzN6BQdxZvFY9D7iAceBhjysrwV/c3WLCbpbF2RShOD6mAyTIEPjAMnmoGgzpNOMFNhZVZguyTrRm+0fPo0JYcQcmJZ1iIA26LDDTxBBHqb0IeJoMAwRj+tnpwTurrAgrh79FwRC5sxzo5CBn9C0OvrPtvKig1mhv06hrfvGrKbGAOQitoq9my/UW18L/pPw+0NyBaEb9siBC2HVwVOfOC+k/4pOeacHABtYPZH3ssi0b/NWkmW4J1NjuNl6vJc5jj7fm6BtmvH7YBKcLoCadkt3AHjsCIOnOCc/AUN54g1nhQ4dObsZK+KQGKeT7J7BqjGLuCJI8guLV4EM8akaHHo/ku10ZWNSvIYWBrUt0i4nk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ebfac8-e1e6-483c-ba8b-08d71c83d060
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 04:41:15.7368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1753
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rp/8pMQLnWKScDEvt40xFmnzLVNrXn+b4Gsn7tupI0I=;
 b=FI+IND6J/MClHkxlDSXHNLof2vXiv7ZglZbSmvHcVSCbW12Eqcp3Hx2mhAnNDJ9ipww4w5iGZLM2YduICYxP+w/glV2qzXqFDKLdEfK8sgqfRK6zKrAPAG8VYOY1U41KHzzw+H6eRqPOfABet+Mvx1u6Si9wwFvHYaxSkDvPKyo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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

U2VyaWVzIGlzDQoNClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFt
ZC5jb20+DQoNClJlZ2FyZHMsDQpIYXdraW5nDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24g
QmVoYWxmIE9mIFRhbyBaaG91DQpTZW50OiAyMDE55bm0OOaciDnml6UgMTI6MjgNClRvOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIu
RGV1Y2hlckBhbWQuY29tPjsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47
IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQpDYzogWmhvdTEs
IFRhbyA8VGFvLlpob3UxQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggMi8yXSBkcm0vYW1kZ3B1
OiByZW1vdmUgUlJFRzY0L1dSRUc2NA0KDQphdG9taWMgNjQgYml0cyBSRUcgb3BlcmF0aW9ucyBh
cmUgdXNlbGVzcyBjdXJyZW50bHkNCg0KU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91
MUBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAg
ICAgIHwgIDQgLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
IHwgMzMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIDIgZmlsZXMgY2hhbmdlZCwgMzcgZGVsZXRp
b25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUu
aCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQppbmRleCBlZDFhMjE3ZTg2
ZTQuLmY2YWU1NjUyYjJlNSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdS5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KQEAg
LTEwNDIsOCArMTA0Miw2IEBAIHZvaWQgYW1kZ3B1X21tX3dyZWcoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsIHVpbnQzMl90IHJlZywgdWludDMyX3QgdiwNCiAJCSAgICB1aW50MzJfdCBhY2Nf
ZmxhZ3MpOw0KIHZvaWQgYW1kZ3B1X21tX3dyZWc4KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LCB1aW50MzJfdCBvZmZzZXQsIHVpbnQ4X3QgdmFsdWUpOyAgdWludDhfdCBhbWRncHVfbW1fcnJl
Zzgoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IG9mZnNldCk7IC11aW50NjRf
dCBhbWRncHVfbW1fcnJlZzY0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCBy
ZWcpOyAtdm9pZCBhbWRncHVfbW1fd3JlZzY0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1
aW50MzJfdCByZWcsIHVpbnQ2NF90IHYpOw0KIA0KIHUzMiBhbWRncHVfaW9fcnJlZyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwgdTMyIHJlZyk7ICB2b2lkIGFtZGdwdV9pb193cmVnKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LCB1MzIgcmVnLCB1MzIgdik7IEBAIC0xMDcxLDggKzEwNjks
NiBAQCBpbnQgZW11X3NvY19hc2ljX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOyAg
I2RlZmluZSBEUkVHMzIocmVnKSBwcmludGsoS0VSTl9JTkZPICJSRUdJU1RFUjogIiAjcmVnICIg
OiAweCUwOFhcbiIsIGFtZGdwdV9tbV9ycmVnKGFkZXYsIChyZWcpLCAwKSkgICNkZWZpbmUgV1JF
RzMyKHJlZywgdikgYW1kZ3B1X21tX3dyZWcoYWRldiwgKHJlZyksICh2KSwgMCkgICNkZWZpbmUg
V1JFRzMyX0lEWChyZWcsIHYpIGFtZGdwdV9tbV93cmVnKGFkZXYsIChyZWcpLCAodiksIEFNREdQ
VV9SRUdTX0lEWCkgLSNkZWZpbmUgUlJFRzY0KHJlZykgYW1kZ3B1X21tX3JyZWc2NChhZGV2LCAo
cmVnKSkgLSNkZWZpbmUgV1JFRzY0KHJlZywgdikgYW1kZ3B1X21tX3dyZWc2NChhZGV2LCAocmVn
KSwgKHYpKSAgI2RlZmluZSBSRUdfU0VUKEZJRUxELCB2KSAoKCh2KSA8PCBGSUVMRCMjX1NISUZU
KSAmIEZJRUxEIyNfTUFTSykgICNkZWZpbmUgUkVHX0dFVChGSUVMRCwgdikgKCgodikgPDwgRklF
TEQjI19TSElGVCkgJiBGSUVMRCMjX01BU0spICAjZGVmaW5lIFJSRUczMl9QQ0lFKHJlZykgYWRl
di0+cGNpZV9ycmVnKGFkZXYsIChyZWcpKSBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jDQppbmRleCA3ZWI5ZTBiOTIzNWEuLjJmNDNjNThmNWQwMyAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQpAQCAtMjYyLDM5ICsyNjIs
NiBAQCB2b2lkIGFtZGdwdV9tbV93cmVnKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50
MzJfdCByZWcsIHVpbnQzMl90IHYsDQogCX0NCiB9DQogDQotLyoqDQotICogYW1kZ3B1X21tX3Jy
ZWc2NCAtIHJlYWQgYSA2NCBiaXQgbWVtb3J5IG1hcHBlZCBJTyByZWdpc3Rlcg0KLSAqDQotICog
QGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcg0KLSAqIEByZWc6IGR3b3JkIGFsaWduZWQgcmVn
aXN0ZXIgb2Zmc2V0DQotICoNCi0gKiBSZXR1cm5zIHRoZSA2NCBiaXQgdmFsdWUgZnJvbSB0aGUg
b2Zmc2V0IHNwZWNpZmllZC4NCi0gKi8NCi11aW50NjRfdCBhbWRncHVfbW1fcnJlZzY0KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCByZWcpIC17DQotCWlmICgocmVnICogNCkg
PCBhZGV2LT5ybW1pb19zaXplKQ0KLQkJcmV0dXJuIGF0b21pYzY0X3JlYWQoKGF0b21pYzY0X3Qg
KikoYWRldi0+cm1taW8gKyAocmVnICogNCkpKTsNCi0JZWxzZQ0KLQkJQlVHKCk7DQotfQ0KLQ0K
LS8qKg0KLSAqIGFtZGdwdV9tbV93cmVnNjQgLSB3cml0ZSB0byBhIDY0IGJpdCBtZW1vcnkgbWFw
cGVkIElPIHJlZ2lzdGVyDQotICoNCi0gKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyDQot
ICogQHJlZzogZHdvcmQgYWxpZ25lZCByZWdpc3RlciBvZmZzZXQNCi0gKiBAdjogNjQgYml0IHZh
bHVlIHRvIHdyaXRlIHRvIHRoZSByZWdpc3Rlcg0KLSAqDQotICogV3JpdGVzIHRoZSB2YWx1ZSBz
cGVjaWZpZWQgdG8gdGhlIG9mZnNldCBzcGVjaWZpZWQuDQotICovDQotdm9pZCBhbWRncHVfbW1f
d3JlZzY0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCByZWcsIHVpbnQ2NF90
IHYpIC17DQotCWlmICgocmVnICogNCkgPCBhZGV2LT5ybW1pb19zaXplKQ0KLQkJYXRvbWljNjRf
c2V0KChhdG9taWM2NF90ICopKGFkZXYtPnJtbWlvICsgKHJlZyAqIDQpKSwgdik7DQotCWVsc2UN
Ci0JCUJVRygpOw0KLX0NCi0NCiAvKioNCiAgKiBhbWRncHVfaW9fcnJlZyAtIHJlYWQgYW4gSU8g
cmVnaXN0ZXINCiAgKg0KLS0NCjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
