Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC632115597
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Dec 2019 17:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478E06FA55;
	Fri,  6 Dec 2019 16:38:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708D06FA55
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Dec 2019 16:38:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGsx0wLqagKu+A32gVyizI7i+9C1niAq+vlmvCY1To53wfBQKSsZMJoM7wKnWKwDbeb5+V/M+jWQHFzABuIhP6EVzGHLcp+DrD9UYFOcrOcsq8Ly2YOlAkghxOuC3AHhGcJCTB5JSM1utmnsjiQnNoYb3KTX5bnDJ6RG5FPa7H1Ni+1G7SufyqEuZPT/I279SWbySz+lEcWKld2nns298RimicgnHXVAXvuhvgBzmAqor4TKdJWETRrj1OFXv8yOF+ByS+q/GZpzAH7DL3PQO1o35FGjZmex724sk2VxzKhfqUo8B+8WOv3eqOpugiggo/g2oc5UCANuXHN7GM4w3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thDP0VNmZL1G2cjbvtWP32uUTB05iKnLtR5guAtg12Q=;
 b=P8RnbddpoX+uQUQVX8b5J2brchwBLR9zKf2kAohP1VO4TUMtgMYZ9ZUkZ/nDCixG53GZpPXj4jr+p3IDvsLuuh27OsRlyOgzEN/+68RxSeIQ9VkVWxEd6EQCq5CgJgqTamqkMAmYUOb0hyozM1lmwOeUmHorqunKTgTSWfkuYVlm11sIU6uoIHC2epVLF4z3RME2EFutPloblsSYJJYI/V+WrjX+1b4U0Gc+BNN+7tf9YH+d3FxQaH2bdhUcmsIZWnsNM38QpzttkkrnJdcmKn4U0W5vJ9Ub+pWHq6yP9NXB8t+O63oBoMukDidO5/7AnXZUnTfM5YlRYrGX9RjnsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0039.namprd12.prod.outlook.com (10.172.79.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Fri, 6 Dec 2019 16:38:17 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d%11]) with mapi id 15.20.2516.017; Fri, 6 Dec 2019
 16:38:16 +0000
Subject: Re: [PATCH] drm: Add FEC registers for LT-tunable repeaters
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20191205135856.232784-1-Rodrigo.Siqueira@amd.com>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <259e4632-02ba-a671-09b5-79a686a2c2d4@amd.com>
Date: Fri, 6 Dec 2019 11:38:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
In-Reply-To: <20191205135856.232784-1-Rodrigo.Siqueira@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::35) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6a843870-62ce-453f-e8af-08d77a6ab1d5
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0039:|CY4PR1201MB0039:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0039F584825EC0FDF5614E3B8C5F0@CY4PR1201MB0039.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:254;
X-Forefront-PRVS: 0243E5FD68
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(199004)(189003)(54906003)(229853002)(31686004)(2906002)(2870700001)(31696002)(316002)(305945005)(66946007)(50466002)(58126008)(99286004)(76176011)(66556008)(478600001)(66476007)(4326008)(65956001)(6486002)(81166006)(81156014)(53546011)(6506007)(8936002)(26005)(6512007)(8676002)(186003)(2616005)(36756003)(52116002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0039;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EV2x7X2Pt9qmb3KSxo6pIS5BesU3MxmbOqNHB0lPaA3wiZUBEJslOVoAKZrMfwF+DTbONIutklgjRDEAeXeL0pqKBcAtzMGfmtY0VoNKNyfqJ5TM77gCb0jZoRirO9I7kRvVASoUK1WYuDW9ZuAQkNZuaQrctNg+iiZYvFCnWNLjiqRQMpwKJ3vZtv2fwJyAfovDvOA3TRB06dqJXUW/zjsoXohao6pQVUqgHm6He1zUhCk66lGMOjLseHoEQqWgy17azBS9XQeQ5FRZ4zK+fmS1NBJC1M202cIgX9sDnTxZxq6Xh1jgmfOLx6MG1TkGbGjYp6UNjopF2CiabE0CYq61C+Bnnth0aeHBzUfutZN1pbeZ5bxDomJ8BhyBsI5x+H/DzIZ/BDT3sPFVALbhnCGidum4YKHh/uYBtjktzw5GbMZvrq4lYZiCg+snPslc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a843870-62ce-453f-e8af-08d77a6ab1d5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2019 16:38:16.7941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qNdwznPudSnWY+hz/LPvpOVwH6ZJHXi2AE8en2+qrbYWa2qc72ZPR1L/CVuBe4ugU4X89t+xgrD7WZAgSeo2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0039
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thDP0VNmZL1G2cjbvtWP32uUTB05iKnLtR5guAtg12Q=;
 b=AryR3U6nsWe7UkkHMbCJ8zN7htVuaBvtuMjcV+KT9pm3g3C5qzE7mTglbJBEvf03BlGSBUzIwI7zZeRpeeFugjRXgX6YDBAXco3k1OMtJtfTbfmdPn9AoaZerXKcKpoSuig4bl7yfEJ8mnTMF+iVzC8lhnz0IBnbTd7511o0e+s=
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
Cc: Leo Li <sunpeng.li@amd.com>, Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Nikola Cornij <Nikola.Cornij@amd.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMi0wNSA4OjU4IGEubS4sIFJvZHJpZ28gU2lxdWVpcmEgd3JvdGU6Cj4gRkVDIGlz
IHN1cHBvcnRlZCBzaW5jZSBEUCAxLjQsIGFuZCBpdCB3YXMgZXhwYW5kZWQgZm9yIExULXR1bmFi
bGUgaW4gRFAKPiAxLjRhLiBUaGlzIGNvbW1pdCBhZGRzIHRoZSBhZGRyZXNzIHJlZ2lzdGVycyBm
b3IKPiBGRUNfRVJST1JfQ09VTlRfUEhZX1JFUEVBVEVSMSBhbmQgRkVDX0NBUEFCSUxJVFlfUEhZ
X1JFUEVBVEVSMS4KPiAKPiBDYzogQWJkb3VsYXllIEJlcnRoZSA8QWJkb3VsYXllLkJlcnRoZUBh
bWQuY29tPgo+IENjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiBD
YzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Cj4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5p
a3VsYUBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IE1hbmFzaSBOYXZhcmUgPG1hbmFzaS5kLm5hdmFy
ZUBpbnRlbC5jb20+Cj4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQWJkb3VsYXllIEJlcnRoZSA8QWJkb3VsYXllLkJl
cnRoZUBhbWQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvZHJpZ28gU2lxdWVpcmEgPFJvZHJpZ28u
U2lxdWVpcmFAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2Vu
dGxhbmRAYW1kLmNvbT4KCkhhcnJ5Cgo+IC0tLQo+ICBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVy
LmggfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hl
bHBlci5oCj4gaW5kZXggNTFlY2I1MTEyZWY4Li5iMjA1NzAwOWFhYmMgMTAwNjQ0Cj4gLS0tIGEv
aW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hl
bHBlci5oCj4gQEAgLTEwNDIsNiArMTA0Miw4IEBACj4gICNkZWZpbmUgRFBfU1lNQk9MX0VSUk9S
X0NPVU5UX0xBTkUyX1BIWV9SRVBFQVRFUjEJICAgIDB4ZjAwMzkgLyogMS4zICovCj4gICNkZWZp
bmUgRFBfU1lNQk9MX0VSUk9SX0NPVU5UX0xBTkUzX1BIWV9SRVBFQVRFUjEJICAgIDB4ZjAwM2Ig
LyogMS4zICovCj4gICNkZWZpbmUgRFBfRkVDX1NUQVRVU19QSFlfUkVQRUFURVIxCQkJICAgIDB4
ZjAyOTAgLyogMS40ICovCj4gKyNkZWZpbmUgRFBfRkVDX0VSUk9SX0NPVU5UX1BIWV9SRVBFQVRF
UjEgICAgICAgICAgICAgICAgICAgIDB4ZjAyOTEgLyogMS40ICovCj4gKyNkZWZpbmUgRFBfRkVD
X0NBUEFCSUxJVFlfUEhZX1JFUEVBVEVSMSAgICAgICAgICAgICAgICAgICAgIDB4ZjAyOTQgLyog
MS40YSAqLwo+ICAKPiAgLyogUmVwZWF0ZXIgbW9kZXMgKi8KPiAgI2RlZmluZSBEUF9QSFlfUkVQ
RUFURVJfTU9ERV9UUkFOU1BBUkVOVAkJICAgIDB4NTUgICAgLyogMS4zICovCj4gCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
