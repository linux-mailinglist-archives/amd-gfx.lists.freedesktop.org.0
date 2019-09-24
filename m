Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB9ABC127
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 06:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8FC6E9B6;
	Tue, 24 Sep 2019 04:50:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730089.outbound.protection.outlook.com [40.107.73.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB13289755
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 04:50:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIukYGfgpVWSnewKn6Nm5WhZ2FfLbSS6MMxU1GI8Hzkpjfv1xhgrVT36I7sQ0GsTtkWVO+qNjqg6oGrq1oU9TQLDEg5y5z1ebC+7oHbaCaY6JfG3mrEjykj7d0Co+DtLVK5ZFA9GE21K/4MjxQWK8CDi57yofh0ALvh8PHqtKG5bbgNJIIhfV0Sc2MM7dkaFLgIrWrMyPPqfwldIVCmoGgQisUoEXPJIpZOUXHvG06vK31t0eSBXhPirjDCLRmawXYJnEobxwhaDq4sLChgVqhmST1z0h2E3cO60zb0eWmLv5IkMzKsq4xbWGnibPC3EpEAkeJKPEqbZbx0RLBH45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNbX7iI2FcYAAMT9HiQ9f0dQewRTtjAbEYyOzFZoKzU=;
 b=KnckttNfbn3Lg+PrK00TiD/qpnPDOiYQ7Gp4STVpLQCj/tl/+u/ePDWp13bE2Wjk+VC7iidc8Yjo6G/P/l3QFHvSwEMyHNUmn4yykgtUDSr0Cw7lGTrBWteg3pyQwY1RD/o1B/qiRrrcwtwcNdbGNCaayFUAIq738ZHymdFyR+Oi7h8pFvm6MLyBqQl41uYlWKLeU0zG0tXxbIWsQtjAnW74XbuS897azAF3cb/7mfa8UQmGzo/ywewUEqa9CXAmlR8kVgwq+Q1C7QLsvY6oJgkwOmbBpfWORSrl8+EHezpV32f8m+6j7h+C9ZCP8z0wehddgcuwhzdlBV8u9QwHOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3408.namprd12.prod.outlook.com (20.178.243.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Tue, 24 Sep 2019 04:50:08 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 04:50:08 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: update arcturus smu-driver interaction
 header
Thread-Topic: [PATCH] drm/amd/powerplay: update arcturus smu-driver
 interaction header
Thread-Index: AQHVcpOJshmioojAskmoHKSm48kZnw==
Date: Tue, 24 Sep 2019 04:50:07 +0000
Message-ID: <20190924044947.1958-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:203:36::29) To MN2PR12MB3344.namprd12.prod.outlook.com
 (2603:10b6:208:c5::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd6e447a-a55a-47a3-391b-08d740aaac56
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3408; 
x-ms-traffictypediagnostic: MN2PR12MB3408:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3408C5F5770F1C050BD84D72E4840@MN2PR12MB3408.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(189003)(199004)(5660300002)(478600001)(15650500001)(305945005)(316002)(5640700003)(476003)(6916009)(66476007)(1076003)(6512007)(66946007)(66446008)(66556008)(7736002)(64756008)(81166006)(86362001)(8676002)(81156014)(6486002)(6436002)(8936002)(50226002)(71200400001)(2906002)(26005)(256004)(14454004)(66066001)(6116002)(186003)(102836004)(3846002)(2351001)(2501003)(4326008)(71190400001)(25786009)(52116002)(2616005)(6506007)(386003)(486006)(36756003)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3408;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hwwfAg6y2/im6md1CD1xZCd+OoYj+Jwxt8CROWFEiPKZV+12MtvwqdwOciZ8DpGRBSw1KPYnhsLGhEvqTA5Ls6RilKWeM94r/R9CtUjh7v3Cp0L3Gg7+NRRwT0wrbJn8KXjzD5FA3Q/VQrZ2scNXlp9QYT0ysEgZ774k5H7+cGxwfdm2BeveuxUqHnmsne+XRiuNuhLCRlMkUvboelO2oz2cNQP3InliR3ScY16jits+doxRVVmoDKWQDwQUUySN85+8+mvc7sXMYwVHWuBS61bN5TfTpE/NZoO9dzWGQ1R6aOqOamBTGDuLeYFczwmyv/LLbrtNxgOfqlYx0VQ53zuuN1l2tNafmqAavsE6Icj0TcU+xGQzRdxU06Ee6XLNlQRvHznv1T/gcR6qoCRFNx8VHcxxiQrRQztUkiwutMs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6e447a-a55a-47a3-391b-08d740aaac56
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 04:50:08.0711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sm2IQsL4G2vrGXPhmJEOwEMktsM/RR2k9Zr7p/8a7g2NCS1q4a8WmJ9YwJTTpZWf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3408
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNbX7iI2FcYAAMT9HiQ9f0dQewRTtjAbEYyOzFZoKzU=;
 b=gLlW0WemXxhDrP+Q3BgQBU/ZJtgsE81baNNcCV8AylcZTx+JCEHLDmyLJkh66ToK6H9NKvglfqojrU3cyO9Ukqy6Ly1Xxdg0rmu8LNxeUE+Wli/yJnMOSMqAERIcuBXyFKADvaNih270fCsd/npYizfFWIsMD4pBgmS1WP/NxF4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VG8gcGFpciB0aGUgbGF0ZXN0IFNNVSBmaXJtd2FyZS4KCkNoYW5nZS1JZDogSTM3NmI4YzlkMGM1
YTU2YTM0M2Q0NzdhOTQ1ZDYzYmE4OTRiOTg0ZDMKU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxl
dmFuLnF1YW5AYW1kLmNvbT4KLS0tCiAuLi4vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVy
X2lmX2FyY3R1cnVzLmggIHwgMTUgKysrKysrKystLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9pbmMvc211X3YxMV8wLmggICAgIHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWZfYXJjdHVydXMuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWZfYXJjdHVydXMuaApp
bmRleCA0MGE1MWExNDEzMzYuLjIyNDhkNjgyYzQ2MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZl9hcmN0dXJ1cy5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWZfYXJjdHVydXMu
aApAQCAtMTM3LDIzICsxMzcsMjMgQEAKICNkZWZpbmUgRkVBVFVSRV9EU19TT0NDTEtfTUFTSyAg
ICAgICAgICAgICgxIDw8IEZFQVRVUkVfRFNfU09DQ0xLX0JJVCAgICAgICAgICAgICkKICNkZWZp
bmUgRkVBVFVSRV9EU19MQ0xLX01BU0sgICAgICAgICAgICAgICgxIDw8IEZFQVRVUkVfRFNfTENM
S19CSVQgICAgICAgICAgICAgICkKICNkZWZpbmUgRkVBVFVSRV9EU19GQ0xLX01BU0sgICAgICAg
ICAgICAgICgxIDw8IEZFQVRVUkVfRFNfRkNMS19CSVQgICAgICAgICAgICAgICkKLSNkZWZpbmUg
RkVBVFVSRV9EU19MQ0xLX01BU0sgICAgICAgICAgICAgICgxIDw8IEZFQVRVUkVfRFNfTENMS19C
SVQgICAgICAgICAgICAgICkKKyNkZWZpbmUgRkVBVFVSRV9EU19VQ0xLX01BU0sgICAgICAgICAg
ICAgICgxIDw8IEZFQVRVUkVfRFNfVUNMS19CSVQgICAgICAgICAgICAgICkKICNkZWZpbmUgRkVB
VFVSRV9HRlhfVUxWX01BU0sgICAgICAgICAgICAgICgxIDw8IEZFQVRVUkVfR0ZYX1VMVl9CSVQg
ICAgICAgICAgICAgICkKLSNkZWZpbmUgRkVBVFVSRV9WQ05fUEdfTUFTSyAgICAgICAgICAgICAg
ICgxIDw8IEZFQVRVUkVfVkNOX1BHX0JJVCAgICAgICAgICAgICAgICkKKyNkZWZpbmUgRkVBVFVS
RV9EUE1fVkNOX01BU0sgICAgICAgICAgICAgICgxIDw8IEZFQVRVUkVfRFBNX1ZDTl9CSVQgICAg
ICAgICAgICAgICkKICNkZWZpbmUgRkVBVFVSRV9SU01VX1NNTl9DR19NQVNLICAgICAgICAgICgx
IDw8IEZFQVRVUkVfUlNNVV9TTU5fQ0dfQklUICAgICAgICAgICkKICNkZWZpbmUgRkVBVFVSRV9X
QUZMX0NHX01BU0sgICAgICAgICAgICAgICgxIDw8IEZFQVRVUkVfV0FGTF9DR19CSVQgICAgICAg
ICAgICAgICkKIAogI2RlZmluZSBGRUFUVVJFX1BQVF9NQVNLICAgICAgICAgICAgICAgICAgKDEg
PDwgRkVBVFVSRV9QUFRfQklUICAgICAgICAgICAgICAgICAgKQogI2RlZmluZSBGRUFUVVJFX1RE
Q19NQVNLICAgICAgICAgICAgICAgICAgKDEgPDwgRkVBVFVSRV9URENfQklUICAgICAgICAgICAg
ICAgICAgKQotI2RlZmluZSBGRUFUVVJFX0FQQ0NfTUFTSyAgICAgICAgICAgICAgICAgKDEgPDwg
RkVBVFVSRV9BUENDX0JJVCAgICAgICAgICAgICAgICAgKQorI2RlZmluZSBGRUFUVVJFX0FQQ0Nf
UExVU19NQVNLICAgICAgICAgICAgKDEgPDwgRkVBVFVSRV9BUENDX1BMVVNfQklUICAgICAgICAg
ICAgKQogI2RlZmluZSBGRUFUVVJFX1ZSMEhPVF9NQVNLICAgICAgICAgICAgICAgKDEgPDwgRkVB
VFVSRV9WUjBIT1RfQklUICAgICAgICAgICAgICAgKQogI2RlZmluZSBGRUFUVVJFX1ZSMUhPVF9N
QVNLICAgICAgICAgICAgICAgKDEgPDwgRkVBVFVSRV9WUjFIT1RfQklUICAgICAgICAgICAgICAg
KQogI2RlZmluZSBGRUFUVVJFX0ZXX0NURl9NQVNLICAgICAgICAgICAgICAgKDEgPDwgRkVBVFVS
RV9GV19DVEZfQklUICAgICAgICAgICAgICAgKQogI2RlZmluZSBGRUFUVVJFX0ZBTl9DT05UUk9M
X01BU0sgICAgICAgICAgKDEgPDwgRkVBVFVSRV9GQU5fQ09OVFJPTF9CSVQgICAgICAgICAgKQog
I2RlZmluZSBGRUFUVVJFX1RIRVJNQUxfTUFTSyAgICAgICAgICAgICAgKDEgPDwgRkVBVFVSRV9U
SEVSTUFMX0JJVCAgICAgICAgICAgICAgKQogCi0jZGVmaW5lIEZFQVRVUkVfT1VUX09GX0JBTkRf
TU9OSVRPUl9NQVNLICAoMSA8PCBFQVRVUkVfT1VUX09GX0JBTkRfTU9OSVRPUl9CSVQgICApCi0j
ZGVmaW5lIEZFQVRVUkVfVEVNUF9ERVBFTkRFTlRfVk1JTl9NQVNLICAoMSA8PCBGRUFUVVJFX1RF
TVBfREVQRU5ERU5UX1ZNSU5fTUFTSyApCisjZGVmaW5lIEZFQVRVUkVfT1VUX09GX0JBTkRfTU9O
SVRPUl9NQVNLICAoMSA8PCBGRUFUVVJFX09VVF9PRl9CQU5EX01PTklUT1JfQklUICAgKQorI2Rl
ZmluZSBGRUFUVVJFX1RFTVBfREVQRU5ERU5UX1ZNSU5fTUFTSyAgKDEgPDwgRkVBVFVSRV9URU1Q
X0RFUEVOREVOVF9WTUlOX0JJVCApCiAKIAogLy9GSVhNRSBuZWVkIHVwZGF0aW5nCkBAIC04MDYs
NyArODA2LDcgQEAgdHlwZWRlZiBzdHJ1Y3QgewogCiAgIHVpbnQzMl90IFAyVkNoYXJ6RnJlcVtB
VkZTX1ZPTFRBR0VfQ09VTlRdOyAvLyBpbiAxMEtIeiB1bml0cwogCi0gIHVpbnQzMl90IEVuYWJs
ZWRBdmZzTW9kdWxlc1syXTsKKyAgdWludDMyX3QgRW5hYmxlZEF2ZnNNb2R1bGVzWzNdOwogCiAg
IHVpbnQzMl90IE1tSHViUGFkZGluZ1s4XTsgLy8gU01VIGludGVybmFsIHVzZQogfSBBdmZzRnVz
ZU92ZXJyaWRlX3Q7CkBAIC04NjksNyArODY5LDggQEAgdHlwZWRlZiBzdHJ1Y3QgewogLy8jZGVm
aW5lIFRBQkxFX0FDVElWSVRZX01PTklUT1JfQ09FRkYgIDcKICNkZWZpbmUgVEFCTEVfT1ZFUkRS
SVZFICAgICAgICAgICAgICAgNwogI2RlZmluZSBUQUJMRV9XQUZMX1hHTUlfVE9QT0xPR1kgICAg
ICA4Ci0jZGVmaW5lIFRBQkxFX0NPVU5UICAgICAgICAgICAgICAgICAgIDkKKyNkZWZpbmUgVEFC
TEVfSTJDX0NPTU1BTkRTICAgICAgICAgICAgOQorI2RlZmluZSBUQUJMRV9DT1VOVCAgICAgICAg
ICAgICAgICAgICAxMAogCiAvLyBUaGVzZSBkZWZpbmVzIGFyZSB1c2VkIHdpdGggdGhlIFNNQ19N
U0dfU2V0VWNsa0Zhc3RTd2l0Y2ggbWVzc2FnZS4KIHR5cGVkZWYgZW51bSB7CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMV8wLmggYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMV8wLmgKaW5kZXggYWYxYWRkNTcwMTUz
Li5lNzFmNmZlZGYzYzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2luYy9zbXVfdjExXzAuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
c211X3YxMV8wLmgKQEAgLTI3LDcgKzI3LDcgQEAKIAogI2RlZmluZSBTTVUxMV9EUklWRVJfSUZf
VkVSU0lPTl9JTlYgMHhGRkZGRkZGRgogI2RlZmluZSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTl9W
RzIwIDB4MTMKLSNkZWZpbmUgU01VMTFfRFJJVkVSX0lGX1ZFUlNJT05fQVJDVCAweDBBCisjZGVm
aW5lIFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OX0FSQ1QgMHgwRAogI2RlZmluZSBTTVUxMV9EUklW
RVJfSUZfVkVSU0lPTl9OVjEwIDB4MzMKICNkZWZpbmUgU01VMTFfRFJJVkVSX0lGX1ZFUlNJT05f
TlYxMiAweDMzCiAjZGVmaW5lIFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OX05WMTQgMHgzNAotLSAK
Mi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
