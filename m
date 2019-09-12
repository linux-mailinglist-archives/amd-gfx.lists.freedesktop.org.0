Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D666B08FC
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 08:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA0F6EB68;
	Thu, 12 Sep 2019 06:44:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800042.outbound.protection.outlook.com [40.107.80.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21BB6EB68
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 06:44:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6o7OI4nKbGegVzV3ob7AkcRwwQjPK+27Zz8XODJttKOhJp65n08j4rRNNsqB14e59OwPf73wI/lNHd1WC9w/NbYo/KYwhgYKIEikPfPGqHgIKNQPmVHqa7ZMuxA3uWHtDSug8dXSbDV6EbRfdUOk5K7kuhs3ntcQ3EcV3vBcX3j+RST/bzQj8mVUQA/6I/aAiJEP57DI8R8Ykq5XMO/H7fjig3pzmWWGUP8oqYxaoDAi6PMKHorUq4bczqxEyRwdE41f7VBwRB6mBTw2y+WHX+wHClJO+yMo26OW9xWtU07p0wkvx+sh/jppaJ97gbn3V7L4DoK3EX3XK0czKZiZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFYs6GMK7dkma+MZVcGpgKbKxBtWMLBurR71XEWwgMs=;
 b=iLISjXcQ0VqRNFSsSXCCLyRBaM/op/MAVKj5kjnHyZqc5NxgbtZON+hQ0jPF7Q32bN9NW1marubABkzBwDbm7xjKLEdBtDwE6AfgCp9YiyrLObTqRiQKhb2NV1rGzUlZJH5PPmu41R9nnojDoiyKgi8EJLj0IUp6/K/G5EXJCv1wOPLrWo80u/h4aHnfy1/b/rD0KQX4KefuVPvolNf/oyAXiiHkrm/elIcobWiKM8FQeRQbC6pDIrAQKW33PvM5ZnU44J4cGi7sZFICxEqi1NlFgKtUSRZdzwLZZU35ngvl0wtqX8aqrPu1Q7/VmZC6PjPEh8c7mr2ls8bYbGGIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3248.namprd12.prod.outlook.com (20.179.80.74) by
 MN2PR12MB2911.namprd12.prod.outlook.com (20.179.80.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Thu, 12 Sep 2019 06:44:46 +0000
Received: from MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::ad48:9c35:d74d:8e20]) by MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::ad48:9c35:d74d:8e20%6]) with mapi id 15.20.2263.016; Thu, 12 Sep 2019
 06:44:46 +0000
From: "S, Shirish" <Shirish.S@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>
Subject: [PATCH] drm/amdgpu: remove needless usage of #ifdef
Thread-Topic: [PATCH] drm/amdgpu: remove needless usage of #ifdef
Thread-Index: AQHVaTWQG9HQejgUn0WN5EZAJ35mCQ==
Date: Thu, 12 Sep 2019 06:44:44 +0000
Message-ID: <1568270671-21346-1-git-send-email-shirish.s@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR01CA0094.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::34)
 To MN2PR12MB3248.namprd12.prod.outlook.com
 (2603:10b6:208:a9::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [165.204.157.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 177ea275-ff65-4ee3-5811-08d7374cb26e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2911; 
x-ms-traffictypediagnostic: MN2PR12MB2911:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2911D93D85C76564E88FF6DCF2B00@MN2PR12MB2911.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(199004)(189003)(66066001)(6512007)(8936002)(305945005)(386003)(6506007)(53936002)(26005)(6486002)(102836004)(6436002)(478600001)(66476007)(66556008)(64756008)(66446008)(4326008)(66946007)(5660300002)(186003)(7736002)(50226002)(316002)(2906002)(8676002)(81156014)(81166006)(110136005)(6636002)(3846002)(6116002)(86362001)(54906003)(99286004)(52116002)(2616005)(486006)(256004)(71200400001)(71190400001)(14454004)(36756003)(25786009)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2911;
 H:MN2PR12MB3248.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1izDDLkL1Sn+JTYKT1k/niKIIMR3xENSLO56DI65y4TZYOvsTwLbfAxXb9lSExnCZdolAPjZJAntdby85JXVvwyd9ewv38uKWnLbZLVdJov22/eX03/uyCXAmsrXOfwQPgKL1Nh4uUiuFNqxX5Z4UkjW6EGeVEoG0U7UXu3FbzSN/b5OndcpXMVdKEwtkRpjYydUHHFdBr/VdhAQfdT9MP/FC570OLRBT2nHTBCBNcyiCXGPCzZzHZAJaMHETR9OcOBuS8VxfJT+GKE6XsDOw1mzTj1dB490c2JL0L52KIwU9qv1weSd3fgDdYcbqif5+o4ovMDBIGmSdSjeqPkb+RO7D1lov5ByYN2tC/DnfQ+LNz2hP5Tr1Cx2bGFKbMSFs33DhwC8NyJCxhSGja59CaYqG+Nq+K6fDAwNcPH22iI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 177ea275-ff65-4ee3-5811-08d7374cb26e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 06:44:45.4438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: njqTfu4vX4uL3/6vHi3S0l04CrvtpCDF2KCqbQoTeICNPs5FwA+lBTRV+CcWlSvzX8QxU6GH3uUX6wTRYdHWOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2911
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFYs6GMK7dkma+MZVcGpgKbKxBtWMLBurR71XEWwgMs=;
 b=SILBZs1DnGWjZj7aJzOSxW4G6ktIxPI2LCtl0e3yS6Ya+y9/mGBaXpCyzzastiesKEJacgRQlDjvP1hH7Zuvkpw8DxqqNr+Pw54Rt+ezwy1qJ/NfEHIBBHMXwJMWexi3kJyJSjA7Bvvk9hLFMVbVsuXp9jBKSkNHiSmKvSwCF2w=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shirish.S@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "S,
 Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ZGVmaW5lIHNjaGVkX3BvbGljeSBpbiBjYXNlIENPTkZJR19IU0FfQU1EIGlzIG5vdAplbmFibGVk
LCB3aXRoIHRoaXMgdGhlcmUgaXMgbm8gbmVlZCB0byBjaGVjayBmb3IgQ09ORklHX0hTQV9BTUQK
ZWxzZSB3aGVyZSBpbiBkcml2ZXIgY29kZS4KClN1Z2dlc3RlZC1ieTogRmVsaXggS3VlaGxpbmcg
PEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNoaXJpc2ggUyA8c2hpcmlz
aC5zQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAg
ICAgIHwgMiArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwg
NiArLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKaW5kZXggYTE1MTZhMy4uNmZmMDJiYiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKQEAgLTE3MSw2ICsxNzEsOCBAQCBleHRl
cm4gaW50IGFtZGdwdV9ub3JldHJ5OwogZXh0ZXJuIGludCBhbWRncHVfZm9yY2VfYXNpY190eXBl
OwogI2lmZGVmIENPTkZJR19IU0FfQU1ECiBleHRlcm4gaW50IHNjaGVkX3BvbGljeTsKKyNlbHNl
CitzdGF0aWMgY29uc3QgaW50IHNjaGVkX3BvbGljeSA9IEtGRF9TQ0hFRF9QT0xJQ1lfSFdTOwog
I2VuZGlmCiAKICNpZmRlZiBDT05GSUdfRFJNX0FNREdQVV9TSQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IDc0MDYzOGUuLjNiNTI4MmIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTE2MjMsMTEgKzE2MjMs
NyBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfaXBfZWFybHlfaW5pdChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKIAl9CiAKIAlhZGV2LT5wbS5wcF9mZWF0dXJlID0gYW1kZ3B1X3BwX2Zl
YXR1cmVfbWFzazsKLQlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpCi0JICAgICNpZmRlZiBDT05G
SUdfSFNBX0FNRAotCSAgICB8fCBzY2hlZF9wb2xpY3kgPT0gS0ZEX1NDSEVEX1BPTElDWV9OT19I
V1MKLQkgICAgI2VuZGlmCi0JICAgICkKKwlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpIHx8IHNj
aGVkX3BvbGljeSA9PSBLRkRfU0NIRURfUE9MSUNZX05PX0hXUykKIAkJYWRldi0+cG0ucHBfZmVh
dHVyZSAmPSB+UFBfR0ZYT0ZGX01BU0s7CiAKIAlmb3IgKGkgPSAwOyBpIDwgYWRldi0+bnVtX2lw
X2Jsb2NrczsgaSsrKSB7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
