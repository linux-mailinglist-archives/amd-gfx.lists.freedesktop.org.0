Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21794DE1D2
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Oct 2019 03:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E3389916;
	Mon, 21 Oct 2019 01:44:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800055.outbound.protection.outlook.com [40.107.80.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753E289916
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 01:44:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbcAfMiMZSYaJjkfabPnUQFErqsaYzLQYDKpcZ3/FxAcyFSK9TpOc1Gs9Tx4hOqp2Y02Ov6+tLb6Y/0p60xtqM6qJBXleZT16Lp5cx3wVeJOUPavGx3By6Z92FLe6GZKB0IX4uBmIsDzY06f3HHs6wEHc6GOL740cOWcAOVJWX5ns67PZir6ZmNSDc2uh8XJr+DeMSNe2UIiXAjV56SAaNbgYf3az7RRXojx+l4K4VmV7OewGJUr+D2Mszn4EO8wShy4F0JPdP7K0xxP05gd39icHfPusS0eWpR4stOl0Xkb4s4a16UPlgU2vlPQHqsrDXK+KQTUYOIBmfH76CDF5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUyliTjaaHOzM0hG/tbflZILekdSuNqORHbIpJnjoWQ=;
 b=BfayBe4Cogp5gu0LeRpuqEgPhZ2OL/D0nS6CdVG691XWdzuCpBbuxLPRgn86iRRFM+E1Tzs1Ur6SyyXCwTsWCRYBVzpobDSfc+qqMEQGup1ZynRJA77YxC2/fXWm/Eq/+7b0hrMdodd9t55HAD78/n0MgZS1/u/+7td2J4/bcpFd7t8EgtObpRp5TVe+TlXEpCQeFcYbrAxGk6VrkM2IB/ZV+j9FNszQAXQdbGlrLAvPLpOR6ARLlaEgqoo0F42GFTFIQI/UvTYrj3I6dfhjMjNjmmcIUKnNWqMAwFoUS7pbgMKGDhbkIp3ZaG0qqntvK/KqjWgjtD+85TjeRLdGDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB2872.namprd12.prod.outlook.com (20.179.91.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Mon, 21 Oct 2019 01:44:49 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::cd:2613:ee29:5acb]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::cd:2613:ee29:5acb%7]) with mapi id 15.20.2367.019; Mon, 21 Oct 2019
 01:44:49 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/4] drm/amd/powerplay: Add EEPROM I2C read/write support
 to Arcturus.
Thread-Topic: [PATCH 2/4] drm/amd/powerplay: Add EEPROM I2C read/write support
 to Arcturus.
Thread-Index: AQHVhfWWhXX1jpifiE6Ee8RrGozdC6dkVJKA
Date: Mon, 21 Oct 2019 01:44:48 +0000
Message-ID: <BYAPR12MB2806C91E6A75F053D9C88718F1690@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <1571431711-30149-1-git-send-email-andrey.grodzovsky@amd.com>
 <1571431711-30149-3-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1571431711-30149-3-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 929d3c1b-e7bc-428d-7745-08d755c8425d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BYAPR12MB2872:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB287289096E259047FF43D1B2F1690@BYAPR12MB2872.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39850400004)(396003)(366004)(136003)(346002)(189003)(199004)(13464003)(476003)(446003)(54906003)(64756008)(305945005)(66556008)(11346002)(486006)(66476007)(66446008)(76116006)(26005)(71190400001)(66946007)(76176011)(316002)(53546011)(110136005)(7696005)(6506007)(256004)(71200400001)(99286004)(14444005)(102836004)(9686003)(8676002)(6436002)(81156014)(55016002)(6246003)(2501003)(81166006)(25786009)(7736002)(8936002)(5660300002)(6116002)(3846002)(186003)(14454004)(4326008)(229853002)(66066001)(74316002)(478600001)(33656002)(2906002)(86362001)(52536014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2872;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +yFVuiU2OnRHtvuDv8gjcj6W3aJg4CKbQQ31B6T1EdU1g88AjAYf9DUlGHLyjLu7bOLh/j/aVrWx4OKYFo3cSYrm0NjumS6IYQPRT2lxjVVUWRh6yAao4n+jL8tYnpNFBZsP5I2cj2mwy0P0UxWSL5+3lrMWZ8uX2Y66ZYx9Mh6jZPUr28VNzLLRVVT/eoozHBTPOhKBvnYWqyIcw9l5uzVACYGK9b0Xx3mHETQKxgCo9e1YwjiNTtJJzw/mPjeFkIIp8R6iQOYdUKWcPcCSivlF2SmYTfSKABkGcA6gJrDsu4IInb+UZs+6+1patUuag8Oqi3IVIC0M/prx4x1oyjJScKfvmg4lO4Aoo0D3/89y+JjM18y0kAz0zM+jHm2UNkIef9bAVL47v5EIdEjqp9t9g44vCMprv6uXTLFcrXhrc2fgbjbooB6F7PkILp0X
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 929d3c1b-e7bc-428d-7745-08d755c8425d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 01:44:48.9387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DRaX9p8uanF+7ZFY5AvvWxeF9eSiNxmVN+HlNQRXfUMU+7wCxsfMjqcAGRIU4ZdOGD3jNlXCdzjnz78AxzQ6tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2872
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUyliTjaaHOzM0hG/tbflZILekdSuNqORHbIpJnjoWQ=;
 b=FzOBD1M5AHxeqiRc/0CX7L0WtTfRyFB5PzaalYq9EAjc6XBOUe158xr6LUpfMzotAN7ID7TNIIm5oUU/Nq7lbz5vUMAazEGNKLHF/per6YuyY2AQ/5mTLUVk0X2M7/o+ZQsJdzgjE0w36mP2Nw6MPULpmJ1tKSPFhozGpnqL6zg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Grodzovsky,
 Andrey" <Andrey.Grodzovsky@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>,
 "noreply-confluence@amd.com" <noreply-confluence@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q29tbWVudCBpbmxpbmUuCgoKUmVnYXJkcywKR3VjaHVuCgotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQpGcm9tOiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4g
ClNlbnQ6IFNhdHVyZGF5LCBPY3RvYmVyIDE5LCAyMDE5IDQ6NDggQU0KVG86IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+
OyBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRlciA8QWxl
eGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IG5vcmVwbHktY29uZmx1ZW5jZUBhbWQuY29tOyBRdWFu
LCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT47IEdyb2R6b3Zza3ksIEFuZHJleSA8QW5kcmV5Lkdy
b2R6b3Zza3lAYW1kLmNvbT4KU3ViamVjdDogW1BBVENIIDIvNF0gZHJtL2FtZC9wb3dlcnBsYXk6
IEFkZCBFRVBST00gSTJDIHJlYWQvd3JpdGUgc3VwcG9ydCB0byBBcmN0dXJ1cy4KClRoZSBjb21t
dW5pY2F0aW9uIGlzIGRvbmUgdGhyb3VnaCBTTVUgdGFibGUgYW5kIGhlbmNlIHRoZSBjb2RlIGlz
IGluIHBvd2VycGxheS4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXku
Z3JvZHpvdnNreUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Fy
Y3R1cnVzX3BwdC5jIHwgMjI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDIyOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9hcmN0dXJ1c19wcHQuYwppbmRleCA5MGQ4NzFhLi41M2QwOGRlNSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMKQEAgLTM2LDYgKzM2LDExIEBACiAj
aW5jbHVkZSAic211X3YxMV8wX3BwdGFibGUuaCIKICNpbmNsdWRlICJhcmN0dXJ1c19wcHNtYy5o
IgogI2luY2x1ZGUgIm5iaW8vbmJpb183XzRfc2hfbWFzay5oIgorI2luY2x1ZGUgPGxpbnV4L2ky
Yy5oPgorI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgorI2luY2x1ZGUgImFtZGdwdV9yYXMuaCIKKwor
I2RlZmluZSB0b19hbWRncHVfZGV2aWNlKHgpIChjb250YWluZXJfb2YoeCwgc3RydWN0IGFtZGdw
dV9yYXMsIAorZWVwcm9tX2NvbnRyb2wuZWVwcm9tX2FjY2Vzc29yKSktPmFkZXYKIAogI2RlZmlu
ZSBDVEZfT0ZGU0VUX0VER0UJCQk1CiAjZGVmaW5lIENURl9PRkZTRVRfSE9UU1BPVAkJNQpAQCAt
MTcxLDYgKzE3Niw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc211XzExXzBfY21uMmFpc2NfbWFwcGluZyBh
cmN0dXJ1c190YWJsZV9tYXBbU01VX1RBQkxFX0NPVU5UXSA9IHsKIAlUQUJfTUFQKFNNVV9NRVRS
SUNTKSwKIAlUQUJfTUFQKERSSVZFUl9TTVVfQ09ORklHKSwKIAlUQUJfTUFQKE9WRVJEUklWRSks
CisJVEFCX01BUChJMkNfQ09NTUFORFMpLAogfTsKIAogc3RhdGljIHN0cnVjdCBzbXVfMTFfMF9j
bW4yYWlzY19tYXBwaW5nIGFyY3R1cnVzX3B3cl9zcmNfbWFwW1NNVV9QT1dFUl9TT1VSQ0VfQ09V
TlRdID0geyBAQCAtMjkzLDYgKzI5OSw5IEBAIHN0YXRpYyBpbnQgYXJjdHVydXNfdGFibGVzX2lu
aXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHN0cnVjdCBzbXVfdGFibGUgKnRhYmxlCiAJU01V
X1RBQkxFX0lOSVQodGFibGVzLCBTTVVfVEFCTEVfU01VX01FVFJJQ1MsIHNpemVvZihTbXVNZXRy
aWNzX3QpLAogCQkgICAgICAgUEFHRV9TSVpFLCBBTURHUFVfR0VNX0RPTUFJTl9WUkFNKTsKIAor
CVNNVV9UQUJMRV9JTklUKHRhYmxlcywgU01VX1RBQkxFX0kyQ19DT01NQU5EUywgc2l6ZW9mKFN3
STJjUmVxdWVzdF90KSwKKwkJCSAgICAgICBQQUdFX1NJWkUsIEFNREdQVV9HRU1fRE9NQUlOX1ZS
QU0pOworCiAJc211X3RhYmxlLT5tZXRyaWNzX3RhYmxlID0ga3phbGxvYyhzaXplb2YoU211TWV0
cmljc190KSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFzbXVfdGFibGUtPm1ldHJpY3NfdGFibGUpCiAJ
CXJldHVybiAtRU5PTUVNOwpAQCAtMTkyNyw2ICsxOTM2LDIyNCBAQCBzdGF0aWMgaW50IGFyY3R1
cnVzX2RwbV9zZXRfdXZkX2VuYWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgYm9vbCBlbmFi
bGUpCiAJcmV0dXJuIHJldDsKIH0KIAorCitzdGF0aWMgdm9pZCBhcmN0dXJ1c19maWxsX2VlcHJv
bV9pMmNfcmVxKFN3STJjUmVxdWVzdF90ICAqcmVxLCBib29sIHdyaXRlLAorCQkJCSAgdWludDhf
dCBhZGRyZXNzLCB1aW50MzJfdCBudW1ieXRlcywKKwkJCQkgIHVpbnQ4X3QgKmRhdGEpCit7CisJ
aW50IGk7CisKKwlCVUdfT04obnVtYnl0ZXMgPiBNQVhfU1dfSTJDX0NPTU1BTkRTKTsKKworCXJl
cS0+STJDY29udHJvbGxlclBvcnQgPSAwOworCXJlcS0+STJDU3BlZWQgPSAyOworCXJlcS0+U2xh
dmVBZGRyZXNzID0gYWRkcmVzczsKKwlyZXEtPk51bUNtZHMgPSBudW1ieXRlczsKKworCWZvciAo
aSA9IDA7IGkgPCBudW1ieXRlczsgaSsrKSB7CisJCVN3STJjQ21kX3QgKmNtZCA9ICAmcmVxLT5T
d0kyY0NtZHNbaV07CisKKwkJLyogRmlyc3QgMiBieXRlcyBhcmUgYWx3YXlzIHdyaXRlIGZvciBs
b3dlciAyYiBFRVBST00gYWRkcmVzcyAqLworCQlpZiAoaSA8IDIpCisJCQljbWQtPkNtZCA9IDE7
CisJCWVsc2UKKwkJCWNtZC0+Q21kID0gd3JpdGU7CisKKworCQkvKiBBZGQgUkVTVEFSVCBmb3Ig
cmVhZCAgYWZ0ZXIgYWRkcmVzcyBmaWxsZWQgKi8KKwkJY21kLT5DbWRDb25maWcgfD0gKGkgPT0g
MiAmJiAhd3JpdGUpID8gQ01EQ09ORklHX1JFU1RBUlRfTUFTSyA6IDA7CisKKwkJLyogQWRkIFNU
T1AgaW4gdGhlIGVuZCAqLworCQljbWQtPkNtZENvbmZpZyB8PSAoaSA9PSAobnVtYnl0ZXMgLSAx
KSkgPyBDTURDT05GSUdfU1RPUF9NQVNLIDogMDsKKworCQkvKiBGaWxsIHdpdGggZGF0YSByZWdh
cmRsZXNzIGlmIHJlYWQgb3Igd3JpdGUgdG8gc2ltcGxpZnkgY29kZSAqLworCQljbWQtPlJlZ2lz
dGVyQWRkciA9IGRhdGFbaV07CisJfQorfQorCitzdGF0aWMgaW50IGFyY3R1cnVzX2kyY19lZXBy
b21fcmVhZF9kYXRhKHN0cnVjdCBpMmNfYWRhcHRlciAqY29udHJvbCwKKwkJCQkJICAgICAgIHVp
bnQ4X3QgYWRkcmVzcywKKwkJCQkJICAgICAgIHVpbnQ4X3QgKmRhdGEsCisJCQkJCSAgICAgICB1
aW50MzJfdCBudW1ieXRlcykKK3sKKwl1aW50MzJfdCAgaSwgcmV0ID0gMDsKKwlTd0kyY1JlcXVl
c3RfdCByZXE7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSB0b19hbWRncHVfZGV2aWNl
KGNvbnRyb2wpOworCXN0cnVjdCBzbXVfdGFibGVfY29udGV4dCAqc211X3RhYmxlID0gJmFkZXYt
PnNtdS5zbXVfdGFibGU7CisJc3RydWN0IHNtdV90YWJsZSAqdGFibGUgPSAmc211X3RhYmxlLT50
YWJsZXNbU01VX1RBQkxFX0kyQ19DT01NQU5EU107CisKKwltZW1zZXQoJnJlcSwgMCwgc2l6ZW9m
KHJlcSkpOworCWFyY3R1cnVzX2ZpbGxfZWVwcm9tX2kyY19yZXEoJnJlcSwgZmFsc2UsIGFkZHJl
c3MsIG51bWJ5dGVzLCBkYXRhKTsKKworCW11dGV4X2xvY2soJmFkZXYtPnNtdS5tdXRleCk7CisJ
LyogTm93IHJlYWQgZGF0YSBzdGFydGluZyB3aXRoIHRoYXQgYWRkcmVzcyAqLworCXJldCA9IHNt
dV91cGRhdGVfdGFibGUoJmFkZXYtPnNtdSwgU01VX1RBQkxFX0kyQ19DT01NQU5EUywgMCwgJnJl
cSwKKwkJCQkJdHJ1ZSk7CisJbXV0ZXhfdW5sb2NrKCZhZGV2LT5zbXUubXV0ZXgpOworCisJaWYg
KCFyZXQpIHsKKwkJU3dJMmNSZXF1ZXN0X3QgKnJlcyA9IChTd0kyY1JlcXVlc3RfdCAqKXRhYmxl
LT5jcHVfYWRkcjsKKworCQkvKiBBc3N1bWUgU01VICBmaWxscyByZXMuU3dJMmNDbWRzW2ldLkRh
dGEgd2l0aCByZWFkIGJ5dGVzICovCisJCWZvciAoaSA9IDA7IGkgPCBudW1ieXRlczsgaSsrKQor
CQkJZGF0YVtpXSA9IHJlcy0+U3dJMmNDbWRzW2ldLkRhdGE7CisKKwkJcHJfZGVidWcoImFyY3R1
cnVzX2kyY19lZXByb21fcmVhZF9kYXRhLCBhZGRyZXNzID0gJXgsIGJ5dGVzID0gJWQsIGRhdGEg
OiIsCisJCQkJICAodWludDE2X3QpYWRkcmVzcywgbnVtYnl0ZXMpOworCisJCXByaW50X2hleF9k
dW1wKEtFUk5fREVCVUcsICJkYXRhOiAiLCBEVU1QX1BSRUZJWF9OT05FLAorCQkJICAgICAgIDgs
IDEsIGRhdGEsIG51bWJ5dGVzLCBmYWxzZSk7CisJfSBlbHNlCisJCXByX2VycigiYXJjdHVydXNf
aTJjX2VlcHJvbV9yZWFkX2RhdGEgLSBlcnJvciBvY2N1cnJlZCA6JXgiLCByZXQpOworCisJcmV0
dXJuIHJldDsKK30KKworc3RhdGljIGludCBhcmN0dXJ1c19pMmNfZWVwcm9tX3dyaXRlX2RhdGEo
c3RydWN0IGkyY19hZGFwdGVyICpjb250cm9sLAorCQkJCQkJdWludDhfdCBhZGRyZXNzLAorCQkJ
CQkJdWludDhfdCAqZGF0YSwKKwkJCQkJCXVpbnQzMl90IG51bWJ5dGVzKQoreworCXVpbnQzMl90
IHJldDsKKwlTd0kyY1JlcXVlc3RfdCByZXE7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYg
PSB0b19hbWRncHVfZGV2aWNlKGNvbnRyb2wpOworCisJbWVtc2V0KCZyZXEsIDAsIHNpemVvZihy
ZXEpKTsKKwlhcmN0dXJ1c19maWxsX2VlcHJvbV9pMmNfcmVxKCZyZXEsIHRydWUsIGFkZHJlc3Ms
IG51bWJ5dGVzLCBkYXRhKTsKKworCW11dGV4X2xvY2soJmFkZXYtPnNtdS5tdXRleCk7CisJcmV0
ID0gc211X3VwZGF0ZV90YWJsZSgmYWRldi0+c211LCBTTVVfVEFCTEVfSTJDX0NPTU1BTkRTLCAw
LCAmcmVxLCB0cnVlKTsKKwltdXRleF91bmxvY2soJmFkZXYtPnNtdS5tdXRleCk7CisKKwlpZiAo
IXJldCkgeworCQlwcl9kZWJ1ZygiYXJjdHVydXNfaTJjX3dyaXRlKCksIGFkZHJlc3MgPSAleCwg
Ynl0ZXMgPSAlZCAsIGRhdGE6ICIsCisJCQkJCSAodWludDE2X3QpYWRkcmVzcywgbnVtYnl0ZXMp
OworCisJCXByaW50X2hleF9kdW1wKEtFUk5fREVCVUcsICJkYXRhOiAiLCBEVU1QX1BSRUZJWF9O
T05FLAorCQkJICAgICAgIDgsIDEsIGRhdGEsIG51bWJ5dGVzLCBmYWxzZSk7CisJCS8qCisJCSAq
IEFjY29yZGluZyB0byBFRVBST00gc3BlYyB0aGVyZSBpcyBhIE1BWCBvZiAxMCBtcyByZXF1aXJl
ZCBmb3IKKwkJICogRUVQUk9NIHRvIGZsdXNoIGludGVybmFsIFJYIGJ1ZmZlciBhZnRlciBTVE9Q
IHdhcyBpc3N1ZWQgYXQgdGhlCisJCSAqIGVuZCBvZiB3cml0ZSB0cmFuc2FjdGlvbi4gRHVyaW5n
IHRoaXMgdGltZSB0aGUgRUVQUk9NIHdpbGwgbm90IGJlCisJCSAqIHJlc3BvbnNpdmUgdG8gYW55
IG1vcmUgY29tbWFuZHMgLSBzbyB3YWl0IGEgYml0IG1vcmUuCisJCSAqLworCQltc2xlZXAoMTAp
OworCisJfSBlbHNlCisJCXByX2VycigiYXJjdHVydXNfaTJjX3dyaXRlLSBlcnJvciBvY2N1cnJl
ZCA6JXgiLCByZXQpOworCisJcmV0dXJuIHJldDsKK30KKworc3RhdGljIGludCBhcmN0dXJ1c19p
MmNfZWVwcm9tX2kyY194ZmVyKHN0cnVjdCBpMmNfYWRhcHRlciAqaTJjX2FkYXAsCisJCQkgICAg
ICBzdHJ1Y3QgaTJjX21zZyAqbXNncywgaW50IG51bSkgeworCXVpbnQzMl90ICBpLCBqLCByZXQs
IGRhdGFfc2l6ZSwgZGF0YV9jaHVua19zaXplLCBuZXh0X2VlcHJvbV9hZGRyID0gMDsKKwl1aW50
OF90ICpkYXRhX3B0ciwgZGF0YV9jaHVua1tNQVhfU1dfSTJDX0NPTU1BTkRTXSA9IHsgMCB9Owor
CisJZm9yIChpID0gMDsgaSA8IG51bTsgaSsrKSB7CisJCS8qCisJCSAqIFNNVSBpbnRlcmZhY2Ug
YWxsb3dzIGF0IG1vc3QgTUFYX1NXX0kyQ19DT01NQU5EUyBieXRlcyBvZiBkYXRhIGF0CisJCSAq
IG9uY2UgYW5kIGhlbmNlIHRoZSBkYXRhIG5lZWRzIHRvIGJlIHNwbGljZWQgaW50byBjaHVua3Mg
YW5kIHNlbnQgZWFjaAorCQkgKiBjaHVuayBzZXBhcmF0ZWx5CisJCSAqLworCQlkYXRhX3NpemUg
PSBtc2dzW2ldLmxlbiAtIDI7CisJCWRhdGFfY2h1bmtfc2l6ZSA9IE1BWF9TV19JMkNfQ09NTUFO
RFMgLSAyOworCQluZXh0X2VlcHJvbV9hZGRyID0gKG1zZ3NbaV0uYnVmWzBdIDw8IDggJiAweGZm
MDApIHwgKG1zZ3NbaV0uYnVmWzFdICYgMHhmZik7CisJCWRhdGFfcHRyID0gbXNnc1tpXS5idWYg
KyAyOworCisJCWZvciAoaiA9IDA7IGogPCBkYXRhX3NpemUgLyBkYXRhX2NodW5rX3NpemU7IGor
KykgeworCQkJLyogSW5zZXJ0IHRoZSBFRVBST00gZGVzdCBhZGRlc3MsIGJpdHMgMC0xNSAqLwor
CQkJZGF0YV9jaHVua1swXSA9ICgobmV4dF9lZXByb21fYWRkciA+PiA4KSAmIDB4ZmYpOworCQkJ
ZGF0YV9jaHVua1sxXSA9IChuZXh0X2VlcHJvbV9hZGRyICYgMHhmZik7CisKKwkJCWlmIChtc2dz
W2ldLmZsYWdzICYgSTJDX01fUkQpIHsKKwkJCQlyZXQgPSBhcmN0dXJ1c19pMmNfZWVwcm9tX3Jl
YWRfZGF0YShpMmNfYWRhcCwKKwkJCQkJCQkJKHVpbnQ4X3QpbXNnc1tpXS5hZGRyLAorCQkJCQkJ
CQlkYXRhX2NodW5rLCBNQVhfU1dfSTJDX0NPTU1BTkRTKTsKKworCQkJCW1lbWNweShkYXRhX3B0
ciwgZGF0YV9jaHVuayArIDIsIGRhdGFfY2h1bmtfc2l6ZSk7CisJCQl9IGVsc2UgeworCisJCQkJ
bWVtY3B5KGRhdGFfY2h1bmsgKyAyLCBkYXRhX3B0ciwgZGF0YV9jaHVua19zaXplKTsKKworCQkJ
CXJldCA9IGFyY3R1cnVzX2kyY19lZXByb21fd3JpdGVfZGF0YShpMmNfYWRhcCwKKwkJCQkJCQkJ
ICh1aW50OF90KW1zZ3NbaV0uYWRkciwKKwkJCQkJCQkJIGRhdGFfY2h1bmssIE1BWF9TV19JMkNf
Q09NTUFORFMpOworCQkJfQorCisJCQlpZiAocmV0KSB7CisJCQkJbnVtID0gLUVJTzsKKwkJCQln
b3RvIGZhaWw7CisJCQl9CisKKwkJCW5leHRfZWVwcm9tX2FkZHIgKz0gZGF0YV9jaHVua19zaXpl
OworCQkJZGF0YV9wdHIgKz0gZGF0YV9jaHVua19zaXplOworCQl9CisKKwkJaWYgKGRhdGFfc2l6
ZSAlIGRhdGFfY2h1bmtfc2l6ZSkgeworCQkJZGF0YV9jaHVua1swXSA9ICgobmV4dF9lZXByb21f
YWRkciA+PiA4KSAmIDB4ZmYpOworCQkJZGF0YV9jaHVua1sxXSA9IChuZXh0X2VlcHJvbV9hZGRy
ICYgMHhmZik7CisKKwkJCWlmIChtc2dzW2ldLmZsYWdzICYgSTJDX01fUkQpIHsKKwkJCQlyZXQg
PSBhcmN0dXJ1c19pMmNfZWVwcm9tX3JlYWRfZGF0YShpMmNfYWRhcCwKKwkJCQkJCQkJKHVpbnQ4
X3QpbXNnc1tpXS5hZGRyLAorCQkJCQkJCQlkYXRhX2NodW5rLCAoZGF0YV9zaXplICUgZGF0YV9j
aHVua19zaXplKSArIDIpOworCisJCQkJbWVtY3B5KGRhdGFfcHRyLCBkYXRhX2NodW5rICsgMiwg
ZGF0YV9zaXplICUgZGF0YV9jaHVua19zaXplKTsKKwkJCX0gZWxzZSB7CisJCQkJbWVtY3B5KGRh
dGFfY2h1bmsgKyAyLCBkYXRhX3B0ciwgZGF0YV9zaXplICUgZGF0YV9jaHVua19zaXplKTsKKwor
CQkJCXJldCA9IGFyY3R1cnVzX2kyY19lZXByb21fd3JpdGVfZGF0YShpMmNfYWRhcCwKKwkJCQkJ
CQkJICh1aW50OF90KW1zZ3NbaV0uYWRkciwKKwkJCQkJCQkJIGRhdGFfY2h1bmssIChkYXRhX3Np
emUgJSBkYXRhX2NodW5rX3NpemUpICsgMik7CisJCQl9CisKKwkJCWlmIChyZXQpIHsKKwkJCQlu
dW0gPSAtRUlPOworCQkJCWdvdG8gZmFpbDsKKwkJCX0KKwkJfQorCX0KKworZmFpbDoKKwlyZXR1
cm4gbnVtOworfQorCitzdGF0aWMgdTMyIGFyY3R1cnVzX2kyY19lZXByb21faTJjX2Z1bmMoc3Ry
dWN0IGkyY19hZGFwdGVyICphZGFwKSB7CisJcmV0dXJuIEkyQ19GVU5DX0kyQyB8IEkyQ19GVU5D
X1NNQlVTX0VNVUw7IH0KKworCitzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19hbGdvcml0aG0gYXJj
dHVydXNfaTJjX2VlcHJvbV9pMmNfYWxnbyA9IHsKKwkubWFzdGVyX3hmZXIgPSBhcmN0dXJ1c19p
MmNfZWVwcm9tX2kyY194ZmVyLAorCS5mdW5jdGlvbmFsaXR5ID0gYXJjdHVydXNfaTJjX2VlcHJv
bV9pMmNfZnVuYywKK307CisKK2ludCBhcmN0dXJ1c19pMmNfZWVwcm9tX2NvbnRyb2xfaW5pdChz
dHJ1Y3QgaTJjX2FkYXB0ZXIgKmNvbnRyb2wpCit7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYgPSB0b19hbWRncHVfZGV2aWNlKGNvbnRyb2wpOworCWludCByZXM7CisKKwljb250cm9sLT5v
d25lciA9IFRISVNfTU9EVUxFOworCWNvbnRyb2wtPmNsYXNzID0gSTJDX0NMQVNTX1NQRDsKKwlj
b250cm9sLT5kZXYucGFyZW50ID0gJmFkZXYtPnBkZXYtPmRldjsKKwljb250cm9sLT5hbGdvID0g
JmFyY3R1cnVzX2kyY19lZXByb21faTJjX2FsZ287CisJc25wcmludGYoY29udHJvbC0+bmFtZSwg
c2l6ZW9mKGNvbnRyb2wtPm5hbWUpLCAiUkFTIEVFUFJPTSIpOworCisJcmVzID0gaTJjX2FkZF9h
ZGFwdGVyKGNvbnRyb2wpOworCWlmIChyZXMpCisJCURSTV9FUlJPUigiRmFpbGVkIHRvIHJlZ2lz
dGVyIGh3IGkyYywgZXJyOiAlZFxuIiwgcmVzKTsKKyAKKwlyZXR1cm4gcmVzOworfQpbR3VjaHVu
XUNhbiB3ZSBtb3ZlIHRoaXMgcmVnaXN0ZXIgY29kZSB0byBvbmUgY29tbW9uIGZpbGU/IEFzIEkg
c2F3IG9uIHZlZ2EyMCwgd2UgaGF2ZSB0aGUgc2FtZSBjb2RlIHNtdV92MTFfMF9pMmNfZWVwcm9t
X2NvbnRyb2xfaW5pdCB0byByZWdpc3RlciBpMmMgZGV2aWNlLgpJZiB3ZSBjYW4gbW92ZSBzdWNo
IGNvZGUgdG8gYSBjb21tb24gZmlsZSwgdGhlbiBpbiBlYWNoIGFzaWMncyBpMmMgY29kZSwgd2hh
dCB3ZSBzaG91bGQgZG8gaXMgdG8gcGFzcyBuZWNlc3NhcnkgcHRycy9uYW1lL29wcyB0byB0aGF0
IGNvbW1vbiBmaWxlLCBhbmQgZnJvbSB0aGVyZSwgd2Ugd2lsbCByZWdpc3RlciBpMmMgZGV2aWNl
LgpUaGlzIGNhbiBoZWxwIGNsZWFuIHNvbWUgY29kZSwgd2hhdGV2ZXIsIG1heWJlIGNvbnZlbmll
bnQgdG8gb3RoZXIgYXNpY3MgaWYgd2Ugd2FudCB0byBkbyB0aGUgc2FtZSBpMmMgYWRkaW5nIGpv
Yi4KCit2b2lkIGFyY3R1cnVzX2kyY19lZXByb21fY29udHJvbF9maW5pKHN0cnVjdCBpMmNfYWRh
cHRlciAqY29udHJvbCkKK3sKKwlpMmNfZGVsX2FkYXB0ZXIoY29udHJvbCk7Cit9CisKW0d1Y2h1
bl1UaGUgc2FtZSBhcyBhYm92ZS4KCiBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3Mg
YXJjdHVydXNfcHB0X2Z1bmNzID0gewogCS8qIHRyYW5zbGF0ZSBzbXUgaW5kZXggaW50byBhcmN0
dXJ1cyBzcGVjaWZpYyBpbmRleCAqLwogCS5nZXRfc211X21zZ19pbmRleCA9IGFyY3R1cnVzX2dl
dF9zbXVfbXNnX2luZGV4LApAQCAtMTk2Niw2ICsyMTkzLDggQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBwcHRhYmxlX2Z1bmNzIGFyY3R1cnVzX3BwdF9mdW5jcyA9IHsKIAkuZ2V0X3Bvd2VyX2xpbWl0
ID0gYXJjdHVydXNfZ2V0X3Bvd2VyX2xpbWl0LAogCS5pc19kcG1fcnVubmluZyA9IGFyY3R1cnVz
X2lzX2RwbV9ydW5uaW5nLAogCS5kcG1fc2V0X3V2ZF9lbmFibGUgPSBhcmN0dXJ1c19kcG1fc2V0
X3V2ZF9lbmFibGUsCisJLmkyY19lZXByb21faW5pdCA9IGFyY3R1cnVzX2kyY19lZXByb21fY29u
dHJvbF9pbml0LAorCS5pMmNfZWVwcm9tX2ZpbmkgPSBhcmN0dXJ1c19pMmNfZWVwcm9tX2NvbnRy
b2xfZmluaSwKIH07CiAKIHZvaWQgYXJjdHVydXNfc2V0X3BwdF9mdW5jcyhzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSkKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
