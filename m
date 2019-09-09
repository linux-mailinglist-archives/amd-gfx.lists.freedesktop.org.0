Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E06DADFC2
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 22:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A879389664;
	Mon,  9 Sep 2019 20:02:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690052.outbound.protection.outlook.com [40.107.69.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD02F89664
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 20:02:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXRxkBhtbkrG6wb9gQcXsck1nqUQrwwmydoUC2rq+Ou1bwjCMWsLj5AKL/9Pc7J7ewi3c9gaDIPjZRKHFteOKiudaBBcTrxd/isQSyEYNnO4m2iXRAwK/s5P5uZ2x5FpUYoldKo8BNS5fYRya6yDMTvzo7WPH55TlgNRlvlmtjZmLDGnk1FBy3XBw1Q2k7k9xLT6dl4BltVRPM8fXSygGOpCWSkpMjRoCh2BKE8X/Bn/0hmC/oKPZ1mVAEU0HRM+5lZ+/6CuA6winuTBwTTen815N5EPs/pynKxZmwRg8euXF2k/xBxd+RiNkoZcD4uIC+k8d13ltVmmx1t+p1CVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wtKnpBE2Dvxq3ECr3d4djlgP45OHql4i+UsEVvniWQ=;
 b=O9ywRGFaj7P17+q5Y/O2FKRjEmwmowjI0iK0IF/BmboKPA+2lX/v5LXa9V9Xfuda3cTbyNo0QCnDZqyjFAyubxVfHBK8v9Z0dlEP+koBRp3dBlZeMb4C6Ij4tnhrSdei8Wcl/qOC71l8B2RTloD7UmBoBVWvrhRh9SzAle3ews7+YPuEvDSxmZ13X9bT3vY1iQz7wH6WJfLj1cMFB8NL1JWrzmW4ejMYE8y9cWBTCbH3aKcYJbU4YJ9rdJ2Z1l6J+dD/3GPKqUkTJFO0YKeJcQW7pjYrWsu6hBYuqbTAxNN8PKj4eyWUV9psCu9LQfDR4AnzyhNfDCTpvv/8dKJkng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0135.namprd12.prod.outlook.com (10.172.75.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.20; Mon, 9 Sep 2019 20:02:23 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 20:02:23 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 0/2] Enable Dali for DC
Thread-Topic: [PATCH 0/2] Enable Dali for DC
Thread-Index: AQHVZxxHEwpxnpSAw0WMWzQ/5nh/NqcjxMKA
Date: Mon, 9 Sep 2019 20:02:23 +0000
Message-ID: <35c4fe17-5e4c-c219-1a00-3f91dc8a2c94@amd.com>
References: <20190909143800.3850-1-Bhawanpreet.Lakha@amd.com>
In-Reply-To: <20190909143800.3850-1-Bhawanpreet.Lakha@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
x-clientproxiedby: YTOPR0101CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::47) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ca3473e-c8d3-4d3b-49fe-08d73560a0eb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0135; 
x-ms-traffictypediagnostic: CY4PR1201MB0135:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0135987A328745437D0EF9C18CB70@CY4PR1201MB0135.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(199004)(189003)(26005)(25786009)(229853002)(6436002)(305945005)(99286004)(6486002)(4744005)(66446008)(256004)(81166006)(81156014)(8676002)(316002)(478600001)(66556008)(66476007)(64756008)(76176011)(2906002)(52116002)(53936002)(2501003)(186003)(6506007)(386003)(31686004)(6246003)(11346002)(476003)(5660300002)(53546011)(66066001)(65956001)(36756003)(6512007)(3846002)(8936002)(6116002)(486006)(71190400001)(14454004)(66946007)(7736002)(58126008)(31696002)(110136005)(102836004)(65806001)(2616005)(446003)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0135;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fJtfky9FRdxtPDTUZUYEZmmQ7MzzNL2ymkZjaimfFwbWK2L5l/IRvWzd2hfDzk7Hvvtj1A4cuFEz4l7keEnzgbc1J7iFkt6W49bR8I2BS3ArB6yDdYxZWsulumJ/A7A3wBAX2xx3tCBf4QJ/aT2Wsu/GngOOz8F4ZvIkwqaCOEbh6Cyxyd+X1jxQcFH6FqcStb45wApZCzxxTN9wGHL21qchiJzKJ+oLTEjFaLPthYFLwzvAv16M+Bgavv2+moL1iBxrvnzoMiixNTSC6jZFpbTKwLWGwzjza9+32eJIte7QD7/SCdvXvSfDST9HC2N5aBNwgwqR9SUrlpUbgEl2x3ynoi/1ofWFxjAb2MuJVIy3hnlURi0JK5s1TDOcCZT/IFf1rc/pWeKGxOgg/foXHi+0VYHXRvrpGvKU1gyoAxI=
Content-ID: <824F7E9F8F8E1C44837064FF12917C2E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca3473e-c8d3-4d3b-49fe-08d73560a0eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 20:02:23.1920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gww0tBs2i1xouuNuGyYl8a1vdVpwfXVzdi/oB3F2ZBfmH3YilSYzDGbTQPr71VcP3kjBwOy0c+FqFJKFPLuGig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0135
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wtKnpBE2Dvxq3ECr3d4djlgP45OHql4i+UsEVvniWQ=;
 b=SSw/tDVgfLpbdYiAhHK5Mr8sK6xsp3wDl4VRxBf3MvDDOfsVU5+wctWAJv+Y72uJCoXjwXQE/SDuufPAlVcjwWO7313AT8yu8ake4CUd2yFNdqjMIVFYEPVGG8qgZveULnFmyVfeFkv94ruq9MGgtUb7ziPB6JW/wSOIvpgjt4Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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

U2VyaWVzIGlzDQpBY2tlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5j
b20+DQoNCkhhcnJ5DQoNCk9uIDIwMTktMDktMDkgMTA6MzcgYS5tLiwgQmhhd2FucHJlZXQgTGFr
aGEgd3JvdGU6DQo+IERhbGkgaXMgYSBuZXcgYXNpYyBiYXNlZCBvbiByYXZlbi4gVGhpcyBwYXRj
aCBhZGRzIHRoZSBhc2ljIElEIGFuZA0KPiBzdXBwb3J0IGZvciBpdCBpbiB0aGUgZGlzcGxheSBj
b3JlLg0KPiANCj4gQmhhd2FucHJlZXQgTGFraGEgKDIpOg0KPiAgICBkcm0vYW1kL2Rpc3BsYXk6
IGFkZCBBc2ljIElEIGZvciBEYWxpDQo+ICAgIGRybS9hbWQvZGlzcGxheTogSW1wbGVtZW50IHZv
bHRhZ2UgbGltaXRhdGlvbiBmb3IgZGFsaQ0KPiANCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY2FsY3MvZGNuX2NhbGNzLmMgIHwgNCArKysrDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2luY2x1ZGUvZGFsX2FzaWNfaWQuaCB8IDcgKysrKystLQ0KPiAgIDIgZmls
ZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
