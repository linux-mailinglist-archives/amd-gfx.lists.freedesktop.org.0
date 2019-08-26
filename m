Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C93B9C77D
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 04:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57A46E04A;
	Mon, 26 Aug 2019 02:58:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780082.outbound.protection.outlook.com [40.107.78.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59D26E04A
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 02:58:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YG5OK5uHVVLgNR9mSUNR1fla8bt2qSv6PkbydC5b6Wg/kb/m52md9apvrRucF/f2pk0quJzWlvZInzNTCxeKh5cdtDKDFThZ9LnlbNHbmyx2Ukw07pZ5yPJ9x5tyZmhfE0ND0rhoo/Ui2KQC2E2RtJ/ck+g0iBKR0kwqhQeEqAMFzYCACkfTxKWvTjTbG7zazQZKfoYP1eNuYOmMTaAoUPtx08zA/JfKJaMLDRyqWv7vI9QPNjorfbeetr3dVnEsqnXBhYoDeAo0GPCXyAOGOvtMLLohVgpsmsKNP1iLtszrHpuPksxbAWz2SmX+R/I74FsYewhQM8/kWswyK2FBlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mb7VPQ1+M1QinV5n1xMCtA86+L345XBkK2hfpwanMNY=;
 b=EmclY5Kq8EeviKlT/J+sD0OeHwJDt5XJlBcRzzzURQSSbPAGTMth8Yhoepj8yQYDsgR8VX6bnhtTJbMkQu90ikmRqwZIzdV8CSZGp7MhxQUpez3IPAnSkz/02+gbNr9AqYcdrWoVbrnp2NgZjQrGCyP/0DZaq2WVKQ+6j/9bNogg6E0uIvrOxBOY/zHCHTzuOnW/FL3NiEJHSFV/vsYjs58D9x6wIfgiEzchlLdKQLMdasBOFm5vD72dUulm6iWaiOKVEN0gkXLUAl4NMDN1zcrPH7M/1P8P86DdR4NUe76XHw3EryScAd7l1LXYm/Goi2u97ml7eMcAHd2pSUC1xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3437.namprd12.prod.outlook.com (20.178.240.212) by
 MN2PR12MB4223.namprd12.prod.outlook.com (52.135.48.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 02:58:41 +0000
Received: from MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::7870:cbb6:ec54:54c6]) by MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::7870:cbb6:ec54:54c6%6]) with mapi id 15.20.2199.015; Mon, 26 Aug 2019
 02:58:41 +0000
From: "Xiao, Jack" <Jack.Xiao@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: add dummy read for some GCVM status registers
Thread-Topic: [PATCH] drm/amdgpu: add dummy read for some GCVM status registers
Thread-Index: AQHVWJXEbtDhZIgohkqjAv0ABRVx3qcIiXgA
Date: Mon, 26 Aug 2019 02:58:40 +0000
Message-ID: <MN2PR12MB3437768BA84A35E2BFC95815EFA10@MN2PR12MB3437.namprd12.prod.outlook.com>
References: <20190822030020.13635-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190822030020.13635-1-xiaojie.yuan@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a674a52-ae0f-46db-c5d4-08d729d14cf8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4223; 
x-ms-traffictypediagnostic: MN2PR12MB4223:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4223AEA8DBFD02E17DAE9F4DEFA10@MN2PR12MB4223.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(13464003)(189003)(199004)(26005)(476003)(25786009)(102836004)(446003)(110136005)(76176011)(2906002)(486006)(6246003)(66476007)(478600001)(53936002)(7736002)(256004)(316002)(53546011)(6506007)(54906003)(74316002)(4326008)(99286004)(52536014)(14454004)(229853002)(11346002)(14444005)(305945005)(76116006)(33656002)(8936002)(55016002)(71200400001)(66066001)(6436002)(186003)(71190400001)(8676002)(5660300002)(81166006)(81156014)(86362001)(9686003)(7696005)(2501003)(3846002)(64756008)(66556008)(66946007)(6116002)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4223;
 H:MN2PR12MB3437.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0m8Zl9/JL5hSfKcLslWd+TpTrOEUn0uoBsuZDPXUMa2PsoSi2z2hHyVHFrizA+nni4xO58IehYdJwSQGpcwMckuSeb7B6y83FwxsrjhrIQjnMZWdZyg8kFQ5LogvkoRUDv+Wu7nEI8w0dMRbVbHdT9G9FcoL8NjOLa/QS/4/TA3nRmYT0+G6L7paUWRCX90oCbn2bJ8Wd91zJ+BR6zrrxHFkV/TLcXm/bRHhSru5K8J7eKCqk/ontslvYd2OkImiESSSniOn4YCU+z3PCJRczFhvW1xLhJp290jtbnCzslATP/bbSoCviU/EXmRltP/jgO2SjDamdzpqnKhLInsq/m1o9mr0Wmn/wO34B0Lgoz2NFipwu7LUlBS//klHxJEvKgmYd0mB7fh5gaDHXHGZy6BuIk7I1qlPo53DWBZf3eo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a674a52-ae0f-46db-c5d4-08d729d14cf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 02:58:41.0411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tlOLLjaq0NSC6AEAeYd3Ks+O9XI9FrNFGvERDvIIQvKn4MMckLdJQiXDKpDECtv+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mb7VPQ1+M1QinV5n1xMCtA86+L345XBkK2hfpwanMNY=;
 b=hh4xlE2CjVV6k60EOJJ87Fjev5hJCC9mhJgreL+wmvIVUJJ2Q6CiwkUxNlHMQ2fxOguZTZXKXwL0a+x9ATyUbHATrCNEoYRhbbr/AuZ5q95rMWqUtDwdGfuXczVO8bbwbU/YJYcsw321UhaXDNePjFjjhY1h7W/5IQUOT4ZcKS0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Xiao@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+CgotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQpGcm9tOiBZdWFuLCBYaWFvamllIDxYaWFvamllLll1YW5AYW1kLmNvbT4g
ClNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMjIsIDIwMTkgMTE6MDEgQU0KVG86IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVj
aGVyQGFtZC5jb20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgWGlh
bywgSmFjayA8SmFjay5YaWFvQGFtZC5jb20+OyBZdWFuLCBYaWFvamllIDxYaWFvamllLll1YW5A
YW1kLmNvbT4KU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBhZGQgZHVtbXkgcmVhZCBmb3Ig
c29tZSBHQ1ZNIHN0YXR1cyByZWdpc3RlcnMKClRoZSBHUkJNIHJlZ2lzdGVyIGludGVyZmFjZSBp
cyBub3cgY2FwYWJsZSBvZiBidXJzdGluZyAxIGN5Y2xlIHBlciByZWdpc3RlciB3ci0+d3IsIHdy
LT5yZCBtdWNoIGZhc3RlciB0aGFuIHByZXZpb3VzIG11dGljeWNsZSBwZXIgdHJhbnNhY3Rpb24g
ZG9uZSBpbnRlcmZhY2UuICBUaGlzIGhhcyBjYXVzZWQgYSBwcm9ibGVtIHdoZXJlIHN0YXR1cyBy
ZWdpc3RlcnMgcmVxdWlyaW5nIEhXIHRvIHVwZGF0ZSBoYXZlIGEgMSBjeWNsZSBkZWxheSwgZHVl
IHRvIHRoZSByZWdpc3RlciB1cGRhdGUgaGF2aW5nIHRvIGdvIHRocm91Z2ggR1JCTS4KClNXIG1h
eSBvcGVyYXRlIG9uIGFuIGluY29ycmVjdCB2YWx1ZSBpZiB0aGV5IHdyaXRlIGEgcmVnaXN0ZXIg
YW5kIGltbWVkaWF0ZWx5IGNoZWNrIHRoZSBjb3JyZXNwb25kaW5nIHN0YXR1cyByZWdpc3Rlci4K
ClJlZ2lzdGVycyByZXF1aXJpbmcgSFcgdG8gY2xlYXIgb3Igc2V0IGZpZWxkcyBtYXkgYmUgZGVs
YXllZCBieSAxIGN5Y2xlLgpGb3IgZXhhbXBsZSwKCjEuIHdyaXRlIFZNX0lOVkFMSURBVEVfRU5H
MF9SRVEgbWFzayA9IDVhIDIuIHJlYWQgVk1fSU5WQUxJREFURV9FTkcwX0FDSyB0aWxsIHRoZSBh
Y2sgaXMgc2FtZSBhcyB0aGUgcmVxdWVzdCBtYXNrID0gNWEKICAgIGEuIEhXIHdpbGwgcmVzZXQg
Vk1fSU5WQUxJREFURV9FTkcwX0FDSyA9IDAgdW50aWwgaW52YWxpZGF0aW9uIGlzIGNvbXBsZXRl
IDMuIHdyaXRlIFZNX0lOVkFMSURBVEVfRU5HMF9SRVEgbWFzayA9IDVhIDQuIHJlYWQgVk1fSU5W
QUxJREFURV9FTkcwX0FDSyB0aWxsIHRoZSBhY2sgaXMgc2FtZSBhcyB0aGUgcmVxdWVzdCBtYXNr
ID0gNWEKICAgIGEuIEZpcnN0IHJlYWQgb2YgVk1fSU5WQUxJREFURV9FTkcwX0FDSyA9IDVhIGlu
c3RlYWQgb2YgMAogICAgYi4gU2Vjb25kIHJlYWQgb2YgVk1fSU5WQUxJREFURV9FTkcwX0FDSyA9
IDAgYmVjYXVzZQogICAgICAgdGhlIHJlbW90ZSBHUkJNIGgvdyByZWdpc3RlciB0YWtlcyBvbmUg
ZXh0cmEgY3ljbGUgdG8gYmUgY2xlYXJlZAogICAgYy4gSW4gdGhpcyBjYXNlLCBTVyB3aWxsIHNl
ZSBhIGZhbHNlIEFDSyBpZiB0aGV5IGV4aXQgb24gZmlyc3QgcmVhZAoKQWZmZWN0ZWQgcmVnaXN0
ZXJzIChvbmx5IEdDIHZhcmlhbnQpICB8ICBSZWNvbW1lbmRlZCBEdW1teSBSZWFkCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KVk1fSU5WQUxJREFURV9FTkcqX0FDSyAgICAgICAgICAgICAgICB8ICBWTV9JTlZBTElEQVRF
X0VORypfUkVRClZNX0wyX1NUQVRVUyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgVk1fTDJf
U1RBVFVTClZNX0wyX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVTICAgICAgICAgfCAgVk1fTDJfUFJP
VEVDVElPTl9GQVVMVF9TVEFUVVMKVk1fTDJfUFJPVEVDVElPTl9GQVVMVF9BRERSX0hJL0xPMzIg
ICB8ICBWTV9MMl9QUk9URUNUSU9OX0ZBVUxUX0FERFJfSEkvTE8zMgpWTV9MMl9JSF9MT0dfQlVT
WSAgICAgICAgICAgICAgICAgICAgIHwgIFZNX0wyX0lIX0xPR19CVVNZCk1DX1ZNX0wyX1BFUkZD
T1VOVEVSX0hJL0xPICAgICAgICAgICAgfCAgTUNfVk1fTDJfUEVSRkNPVU5URVJfSEkvTE8KQVRD
X0wyX1BFUkZDT1VOVEVSX0hJL0xPICAgICAgICAgICAgICB8ICBBVENfTDJfUEVSRkNPVU5URVJf
SEkvTE8KQVRDX0wyX1BFUkZDT1VOVEVSMl9ISS9MTyAgICAgICAgICAgICB8ICBBVENfTDJfUEVS
RkNPVU5URVIyX0hJL0xPCgpTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVh
bkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jIHwg
MTUgKysrKysrKysrKysrKysrICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5j
ICB8IDE2ICsrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMKaW5kZXggZDgzZDhhNmExZmMw
Li41NmY3NmExZjMyZWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192MTBfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jCkBA
IC0xMzUsNiArMTM1LDE0IEBAIHN0YXRpYyBpbnQgZ21jX3YxMF8wX3Byb2Nlc3NfaW50ZXJydXB0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCWFkZHIgfD0gKCh1NjQpZW50cnktPnNyY19k
YXRhWzFdICYgMHhmKSA8PCA0NDsKIAogCWlmICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKSB7CisJ
CS8qCisJCSAqIElzc3VlIGEgZHVtbXkgcmVhZCB0byB3YWl0IGZvciB0aGUgc3RhdHVzIHJlZ2lz
dGVyIHRvCisJCSAqIGJlIHVwZGF0ZWQgdG8gYXZvaWQgcmVhZGluZyBhbiBpbmNvcnJlY3QgdmFs
dWUgZHVlIHRvCisJCSAqIHRoZSBuZXcgZmFzdCBHUkJNIGludGVyZmFjZS4KKwkJICovCisJCWlm
IChlbnRyeS0+dm1pZF9zcmMgPT0gQU1ER1BVX0dGWEhVQl8wKQorCQkJUlJFRzMyKGh1Yi0+dm1f
bDJfcHJvX2ZhdWx0X3N0YXR1cyk7CisKIAkJc3RhdHVzID0gUlJFRzMyKGh1Yi0+dm1fbDJfcHJv
X2ZhdWx0X3N0YXR1cyk7CiAJCVdSRUczMl9QKGh1Yi0+dm1fbDJfcHJvX2ZhdWx0X2NudGwsIDEs
IH4xKTsKIAl9CkBAIC0yMjgsNiArMjM2LDEzIEBAIHN0YXRpYyB2b2lkIGdtY192MTBfMF9mbHVz
aF92bV9odWIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHZtaWQsCiAKIAlX
UkVHMzJfTk9fS0lRKGh1Yi0+dm1faW52X2VuZzBfcmVxICsgZW5nLCB0bXApOwogCisJLyoKKwkg
KiBJc3N1ZSBhIGR1bW15IHJlYWQgdG8gd2FpdCBmb3IgdGhlIEFDSyByZWdpc3RlciB0byBiZSBj
bGVhcmVkCisJICogdG8gYXZvaWQgYSBmYWxzZSBBQ0sgZHVlIHRvIHRoZSBuZXcgZmFzdCBHUkJN
IGludGVyZmFjZS4KKwkgKi8KKwlpZiAodm1odWIgPT0gQU1ER1BVX0dGWEhVQl8wKQorCQlSUkVH
MzJfTk9fS0lRKGh1Yi0+dm1faW52X2VuZzBfcmVxICsgZW5nKTsKKwogCS8qIFdhaXQgZm9yIEFD
SyB3aXRoIGEgZGVsYXkuKi8KIAlmb3IgKGkgPSAwOyBpIDwgYWRldi0+dXNlY190aW1lb3V0OyBp
KyspIHsKIAkJdG1wID0gUlJFRzMyX05PX0tJUShodWItPnZtX2ludl9lbmcwX2FjayArIGVuZyk7
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCA2ZGUxNzI2N2ZjMzUuLjE3
NzAwNjA2ZjU0YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5
XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCkBAIC0zNTIs
NiArMzUyLDE0IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfcHJvY2Vzc19pbnRlcnJ1cHQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAkvKiBJZiBpdCdzIHRoZSBmaXJzdCBmYXVsdCBmb3Ig
dGhpcyBhZGRyZXNzLCBwcm9jZXNzIGl0IG5vcm1hbGx5ICovCiAJaWYgKCFhbWRncHVfc3Jpb3Zf
dmYoYWRldikpIHsKKwkJLyoKKwkJICogSXNzdWUgYSBkdW1teSByZWFkIHRvIHdhaXQgZm9yIHRo
ZSBzdGF0dXMgcmVnaXN0ZXIgdG8KKwkJICogYmUgdXBkYXRlZCB0byBhdm9pZCByZWFkaW5nIGFu
IGluY29ycmVjdCB2YWx1ZSBkdWUgdG8KKwkJICogdGhlIG5ldyBmYXN0IEdSQk0gaW50ZXJmYWNl
LgorCQkgKi8KKwkJaWYgKGVudHJ5LT52bWlkX3NyYyA9PSBBTURHUFVfR0ZYSFVCXzApCisJCQlS
UkVHMzIoaHViLT52bV9sMl9wcm9fZmF1bHRfc3RhdHVzKTsKKwogCQlzdGF0dXMgPSBSUkVHMzIo
aHViLT52bV9sMl9wcm9fZmF1bHRfc3RhdHVzKTsKIAkJV1JFRzMyX1AoaHViLT52bV9sMl9wcm9f
ZmF1bHRfY250bCwgMSwgfjEpOwogCX0KQEAgLTQ4MCw2ICs0ODgsMTQgQEAgc3RhdGljIHZvaWQg
Z21jX3Y5XzBfZmx1c2hfZ3B1X3RsYihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMy
X3Qgdm1pZCwKIAogCXNwaW5fbG9jaygmYWRldi0+Z21jLmludmFsaWRhdGVfbG9jayk7CiAJV1JF
RzMyX05PX0tJUShodWItPnZtX2ludl9lbmcwX3JlcSArIGVuZywgdG1wKTsKKworCS8qCisJICog
SXNzdWUgYSBkdW1teSByZWFkIHRvIHdhaXQgZm9yIHRoZSBBQ0sgcmVnaXN0ZXIgdG8gYmUgY2xl
YXJlZAorCSAqIHRvIGF2b2lkIGEgZmFsc2UgQUNLIGR1ZSB0byB0aGUgbmV3IGZhc3QgR1JCTSBp
bnRlcmZhY2UuCisJICovCisJaWYgKHZtaHViID09IEFNREdQVV9HRlhIVUJfMCkKKwkJUlJFRzMy
X05PX0tJUShodWItPnZtX2ludl9lbmcwX3JlcSArIGVuZyk7CisKIAlmb3IgKGogPSAwOyBqIDwg
YWRldi0+dXNlY190aW1lb3V0OyBqKyspIHsKIAkJdG1wID0gUlJFRzMyX05PX0tJUShodWItPnZt
X2ludl9lbmcwX2FjayArIGVuZyk7CiAJCWlmICh0bXAgJiAoMSA8PCB2bWlkKSkKLS0KMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
