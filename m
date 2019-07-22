Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 830E46FB07
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 10:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6A4894EA;
	Mon, 22 Jul 2019 08:14:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780054.outbound.protection.outlook.com [40.107.78.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F722894EA
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 08:14:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9HjXONfccsj5Hkpki7wHkYeSFQOAG0zPvRHXc9qZyzM65CdEGQ+ndYQ6TgUFyQfUGgaQ9AR+2ZElB1Gr40D8zs81cTnPCxJ5JH4wTFSLf7xN4oi0xftdHQRD9FpdNh5o0fM8mfJZSXP+SaggkJSkQCXHFfzf/Tu71c7MU3//Ye+96nLdSBPsgpy3IZyhrSvHCJTd2EoaZkjQB6beCeOMAtUVS5331hfAzkHB6a2SBGUTQQPTuUi4slSunNvj4pmFgjq1UUFmkUjdmqSa89Ye1g6wB1Mrbqp1VjqDTCrMjkekDkpha3HaCFL4Uq4iN86gYnwc5T9VoVUOrigz85z3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVoDnb1vQ/+HR/0YqBMwjUQ/6cp1jzqk06/sz8GQAsU=;
 b=Vg+1t86BXj89jRqjdGjtYihj1kjZUcKEAfy+Tdc25s+DyvJqFHMya0qDHMoqWfz5PxWZeq8KwUC2/4UaCN5AElOPdBqZTFQtOPrplnk+6zZlQNxVx0dNPWcxJ0NiQ2ntKYB93r/1lLQjeOlENpsgwVJPDV1ppDYMtEog1jZ9f6EAKW8jRTwKhyovQsLGOiL/IQrSbpW4SXwvy4iipuc2wJBQhBwReiQUhtfkBNCC/4E2Cja4ILoRrIuawTvOz12DVYLsLiiGOTCY34s7i+GHIuXIF9nGzILaxxR5cW8ddkEW8eT81ecKMn0tHNixNuTk5upnFU1EA30/Fy2taIGvdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3057.namprd12.prod.outlook.com (20.178.209.144) by
 BN8PR12MB2994.namprd12.prod.outlook.com (20.178.208.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 08:14:38 +0000
Received: from BN8PR12MB3057.namprd12.prod.outlook.com
 ([fe80::2540:58c6:899e:f502]) by BN8PR12MB3057.namprd12.prod.outlook.com
 ([fe80::2540:58c6:899e:f502%7]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 08:14:37 +0000
From: "Ma, Le" <Le.Ma@amd.com>
To: "Cui, Flora" <Flora.Cui@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH libdrm 1/1] tests/amdgpu: divide dispatch test into
 compute and gfx
Thread-Topic: [PATCH libdrm 1/1] tests/amdgpu: divide dispatch test into
 compute and gfx
Thread-Index: AQHVQGOsBamP/YOww0uj3Hd2b6yKEKbWR/iAgAABDfA=
Date: Mon, 22 Jul 2019 08:14:37 +0000
Message-ID: <BN8PR12MB3057FCC784FE0E59336E478FF6C40@BN8PR12MB3057.namprd12.prod.outlook.com>
References: <1563782474-32675-1-git-send-email-le.ma@amd.com>
 <MN2PR12MB3312F3AD6E32FE6E9587C238FAC40@MN2PR12MB3312.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3312F3AD6E32FE6E9587C238FAC40@MN2PR12MB3312.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d147a591-25be-4697-299b-08d70e7ca39e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB2994; 
x-ms-traffictypediagnostic: BN8PR12MB2994:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB2994AB4E296DC74C1E1C457BF6C40@BN8PR12MB2994.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(13464003)(199004)(189003)(99286004)(33656002)(66066001)(14454004)(9686003)(81156014)(186003)(81166006)(6306002)(6436002)(53546011)(74316002)(55016002)(110136005)(53936002)(76176011)(7696005)(6506007)(102836004)(316002)(6246003)(26005)(486006)(8936002)(8676002)(476003)(478600001)(11346002)(6116002)(68736007)(3846002)(86362001)(966005)(7736002)(2906002)(256004)(305945005)(25786009)(446003)(2501003)(76116006)(66946007)(66446008)(64756008)(66476007)(66556008)(71200400001)(71190400001)(229853002)(5660300002)(52536014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2994;
 H:BN8PR12MB3057.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oWSfle/U2SkwYMpRmG8jlT351Eng477ftEJy4b2s4Dt7dlDqI/eEAu5E9H1Pt5wOpx4QKUjBw2YQtcS/HNGO8qDyOhdI9Wy2XfRGft2aYEEl3HxdcOQGCFbprEMM34Y/KUd3yJT/+XEunxmkkayTMBrMGJObEWeBNTUhsHAxabrAmpewyHfWvRL+g1zW/aG56jk545zSeHF5O8Cncq0zqBPhpUCzTHtNLM3DRki1bjJJsQ9Zmmv2d7k5lOnV++mg0+LZAQcItAqLSQYY9wcAi9atvV1ZtOXBTnFxC4droO36t8K4vfYPHQmxYfLBaXqLtKa4djQWVbnEd3W6szeE+FG05vZSvNovwsbRJ/cg9WEH1UBwqpkclvzf8trlvy5+0XFNNKd0bH9H+bTyc6CfyHovekQbWPF+6A3zfTpN/1M=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d147a591-25be-4697-299b-08d70e7ca39e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 08:14:37.7601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lema1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2994
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVoDnb1vQ/+HR/0YqBMwjUQ/6cp1jzqk06/sz8GQAsU=;
 b=w0CnYZITdSxxNpQpZuX9fj5xZ87hu1bMqP3y4i/U/d/9uhrsBN2oJnBVNJQDmlspKBb6oiCdnzkqfme+3OaRyI831lAyjDYRLYwfMRW9a8QtjdhT43LVrkb+CC8cAB5jN88ocqMdGWJVqGPlBgHkKbITiGBlp0W/35Ts1VlNToQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Le.Ma@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIEZsb3JhLiBObyBuZWVkIGNoYW5nZSBmb3IgZHJhdyB0ZXN0IHNpbmNlIGl0IG9ubHkg
cnVucyBnZnggcmluZyB0ZXN0Lg0KDQpSZWdhcmRzLA0KTWEgTGUNCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IEN1aSwgRmxvcmEgPEZsb3JhLkN1aUBhbWQuY29tPiANClNlbnQ6
IE1vbmRheSwgSnVseSAyMiwgMjAxOSA0OjA3IFBNDQpUbzogTWEsIExlIDxMZS5NYUBhbWQuY29t
PjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBNYSwgTGUgPExlLk1hQGFtZC5j
b20+DQpTdWJqZWN0OiBSRTogW1BBVENIIGxpYmRybSAxLzFdIHRlc3RzL2FtZGdwdTogZGl2aWRl
IGRpc3BhdGNoIHRlc3QgaW50byBjb21wdXRlIGFuZCBnZngNCg0KUGF0Y2ggaXMgUmV2aWV3ZWQt
Ynk6IEZsb3JhIEN1aSA8ZmxvcmEuY3VpQGFtZC5jb20+IENvdWxkIHlvdSBhcHBseSB0aGUgc2lt
aWxhciBjaGFuZ2UgdG8gZHJhdyB0ZXN0Pw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24g
QmVoYWxmIE9mIExlIE1hDQpTZW50OiBNb25kYXksIEp1bHkgMjIsIDIwMTkgNDowMSBQTQ0KVG86
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogTWEsIExlIDxMZS5NYUBhbWQuY29t
PjsgQ3VpLCBGbG9yYSA8RmxvcmEuQ3VpQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggbGliZHJt
IDEvMV0gdGVzdHMvYW1kZ3B1OiBkaXZpZGUgZGlzcGF0Y2ggdGVzdCBpbnRvIGNvbXB1dGUgYW5k
IGdmeA0KDQpmb3IgYmV0dGVyIGNsYXJpZmljYXRpb24NCg0KQ2hhbmdlLUlkOiBJMjQ1ZDc2MGQ1
ZjlkNjRlYjEwYjEzN2Q1Y2UzNzVlZjUyYTRkODczYQ0KU2lnbmVkLW9mZi1ieTogTGUgTWEgPGxl
Lm1hQGFtZC5jb20+DQotLS0NCiB0ZXN0cy9hbWRncHUvYmFzaWNfdGVzdHMuYyB8IDE2ICsrKysr
KysrKysrKystLS0NCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkNCg0KZGlmZiAtLWdpdCBhL3Rlc3RzL2FtZGdwdS9iYXNpY190ZXN0cy5jIGIvdGVzdHMv
YW1kZ3B1L2Jhc2ljX3Rlc3RzLmMgaW5kZXggOTM4MTA2ZS4uZmEwZjU2OCAxMDA2NDQNCi0tLSBh
L3Rlc3RzL2FtZGdwdS9iYXNpY190ZXN0cy5jDQorKysgYi90ZXN0cy9hbWRncHUvYmFzaWNfdGVz
dHMuYw0KQEAgLTU1LDcgKzU1LDggQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3VzZXJwdHJfdGVzdCh2
b2lkKTsgIHN0YXRpYyB2b2lkIGFtZGdwdV9zZW1hcGhvcmVfdGVzdCh2b2lkKTsgIHN0YXRpYyB2
b2lkIGFtZGdwdV9zeW5jX2RlcGVuZGVuY3lfdGVzdCh2b2lkKTsNCiBzdGF0aWMgdm9pZCBhbWRn
cHVfYm9fZXZpY3Rpb25fdGVzdCh2b2lkKTsgLXN0YXRpYyB2b2lkIGFtZGdwdV9kaXNwYXRjaF90
ZXN0KHZvaWQpOw0KK3N0YXRpYyB2b2lkIGFtZGdwdV9jb21wdXRlX2Rpc3BhdGNoX3Rlc3Qodm9p
ZCk7DQorc3RhdGljIHZvaWQgYW1kZ3B1X2dmeF9kaXNwYXRjaF90ZXN0KHZvaWQpOw0KIHN0YXRp
YyB2b2lkIGFtZGdwdV9kcmF3X3Rlc3Qodm9pZCk7DQogc3RhdGljIHZvaWQgYW1kZ3B1X2dwdV9y
ZXNldF90ZXN0KHZvaWQpOw0KIA0KQEAgLTc5LDcgKzgwLDggQEAgQ1VfVGVzdEluZm8gYmFzaWNf
dGVzdHNbXSA9IHsNCiAJeyAiQ29tbWFuZCBzdWJtaXNzaW9uIFRlc3QgKFNETUEpIiwgYW1kZ3B1
X2NvbW1hbmRfc3VibWlzc2lvbl9zZG1hIH0sDQogCXsgIlNXIHNlbWFwaG9yZSBUZXN0IiwgIGFt
ZGdwdV9zZW1hcGhvcmVfdGVzdCB9LA0KIAl7ICJTeW5jIGRlcGVuZGVuY3kgVGVzdCIsICBhbWRn
cHVfc3luY19kZXBlbmRlbmN5X3Rlc3QgfSwNCi0JeyAiRGlzcGF0Y2ggVGVzdCIsICBhbWRncHVf
ZGlzcGF0Y2hfdGVzdCB9LA0KKwl7ICJEaXNwYXRjaCBUZXN0IChDb21wdXRlKSIsICBhbWRncHVf
Y29tcHV0ZV9kaXNwYXRjaF90ZXN0IH0sDQorCXsgIkRpc3BhdGNoIFRlc3QgKEdGWCkiLCAgYW1k
Z3B1X2dmeF9kaXNwYXRjaF90ZXN0IH0sDQogCXsgIkRyYXcgVGVzdCIsICBhbWRncHVfZHJhd190
ZXN0IH0sDQogCXsgIkdQVSByZXNldCBUZXN0IiwgYW1kZ3B1X2dwdV9yZXNldF90ZXN0IH0sDQog
CUNVX1RFU1RfSU5GT19OVUxMLA0KQEAgLTI0NDgsNyArMjQ1MCw4IEBAIHN0YXRpYyB2b2lkIGFt
ZGdwdV9tZW1jcHlfZGlzcGF0Y2hfdGVzdChhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXZpY2VfaGFu
ZGxlLA0KIAlyID0gYW1kZ3B1X2NzX2N0eF9mcmVlKGNvbnRleHRfaGFuZGxlKTsNCiAJQ1VfQVNT
RVJUX0VRVUFMKHIsIDApOw0KIH0NCi1zdGF0aWMgdm9pZCBhbWRncHVfZGlzcGF0Y2hfdGVzdCh2
b2lkKQ0KKw0KK3N0YXRpYyB2b2lkIGFtZGdwdV9jb21wdXRlX2Rpc3BhdGNoX3Rlc3Qodm9pZCkN
CiB7DQogCWludCByOw0KIAlzdHJ1Y3QgZHJtX2FtZGdwdV9pbmZvX2h3X2lwIGluZm87DQpAQCAt
MjQ2Myw2ICsyNDY2LDEzIEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kaXNwYXRjaF90ZXN0KHZvaWQp
DQogCQlhbWRncHVfbWVtc2V0X2Rpc3BhdGNoX3Rlc3QoZGV2aWNlX2hhbmRsZSwgQU1ER1BVX0hX
X0lQX0NPTVBVVEUsIHJpbmdfaWQpOw0KIAkJYW1kZ3B1X21lbWNweV9kaXNwYXRjaF90ZXN0KGRl
dmljZV9oYW5kbGUsIEFNREdQVV9IV19JUF9DT01QVVRFLCByaW5nX2lkKTsNCiAJfQ0KK30NCisN
CitzdGF0aWMgdm9pZCBhbWRncHVfZ2Z4X2Rpc3BhdGNoX3Rlc3Qodm9pZCkgew0KKwlpbnQgcjsN
CisJc3RydWN0IGRybV9hbWRncHVfaW5mb19od19pcCBpbmZvOw0KKwl1aW50MzJfdCByaW5nX2lk
Ow0KIA0KIAlyID0gYW1kZ3B1X3F1ZXJ5X2h3X2lwX2luZm8oZGV2aWNlX2hhbmRsZSwgQU1ER1BV
X0hXX0lQX0dGWCwgMCwgJmluZm8pOw0KIAlDVV9BU1NFUlRfRVFVQUwociwgMCk7DQotLQ0KMi43
LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFt
ZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
