Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20142C1AD4
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2019 07:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7076D6E33A;
	Mon, 30 Sep 2019 05:06:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam05on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe52::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6716E33A
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 05:06:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsV8r0xN1okw0ggRQ3adheCa6VxikANPwp+ng5NwDdL24SlQZmlY+huj96OCyfdG9oSxsHbHEaPlE9yxVqnkaxDnsmCU5hENLkbMy9bA0Z2zcb7xS1zZDCsHlIXYle2dWjw70JunPVuHs5cBjOdKtCzeLY7r0W87St1OiXXZSAxGTGJovsl5qNv8YA7cxIOzzF6/wL4FfJ61m0rdXgSGJ647ttY+vkmPQNGSmDa0dqFlUhdJZO+iLGgfeaRbe0Pww3e4HoDF98hYLWpPAtiiR2k/y4Uw/RHvn7MkSeqY0ZNHFaceoS7NJ2CXrRrSGWrLMPEDLhcodRr2E4FuBeGVJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMKlD4GmDmxnIi0U0FkoFbbGyegLScZFxpUc1Y0ryf8=;
 b=PNxl9Hskc7CqobZQbBJ17M45OwKtcqO8LBFtmWljh0xnzLeo+znDT6Px+2W5vi4LB7RRvsOjd8YgUnp7/WVRjMQjfnYsQIZC3uT7mFMrqrPcu3QOl6mxIl5OTIc9pqML4r5+wer4xg0Umz2Wxp/CJ3+toYhQWnw8a5KOL0oyQFVyIkOi2KCfp5gTk6+twN3HnRTrt0xwAK2+gNZBpYTuQW/YU5errggLDIoPVUMtg+3sLttFBxEaadUS3koc8KvlAMB2zAhki1XsZNArAnlvfH1y7YepWPf7OO8Nqn03Kf2/ZwlBWor8Hu+rpe1w3boMI8VWRyync0NQkjnDTIWe+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3672.namprd12.prod.outlook.com (52.132.246.139) by
 CH2PR12MB3784.namprd12.prod.outlook.com (52.132.231.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 05:06:42 +0000
Received: from CH2PR12MB3672.namprd12.prod.outlook.com
 ([fe80::9d2e:e96c:28e1:b600]) by CH2PR12MB3672.namprd12.prod.outlook.com
 ([fe80::9d2e:e96c:28e1:b600%6]) with mapi id 15.20.2284.028; Mon, 30 Sep 2019
 05:06:42 +0000
From: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "Zhao, Yong" <Yong.Zhao@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>, "Min, Frank" <Frank.Min@amd.com>, "Liu, Shaoyun"
 <Shaoyun.Liu@amd.com>, "Ma, Le" <Le.Ma@amd.com>, "Min, Frank"
 <Frank.Min@amd.com>
Subject: RE: [PATCH] drm/amd/amdgpu/sriov ip block setting of Arcturus
Thread-Topic: [PATCH] drm/amd/amdgpu/sriov ip block setting of Arcturus
Thread-Index: AQHVd0v3n4MNi1QawEqeXYD9bGjTCqdDqdBggAABOtA=
Date: Mon, 30 Sep 2019 05:06:42 +0000
Message-ID: <CH2PR12MB3672A9A2F390828405CA147EBB820@CH2PR12MB3672.namprd12.prod.outlook.com>
References: <20190930050010.7437-1-Jack.Zhang1@amd.com>
 <CH2PR12MB3672980A076473DD5C6E5E82BB820@CH2PR12MB3672.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB3672980A076473DD5C6E5E82BB820@CH2PR12MB3672.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82852918-afec-4c83-1c46-08d74563fbad
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CH2PR12MB3784:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB3784473D65E69E1A86B05145BB820@CH2PR12MB3784.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(13464003)(199004)(189003)(6436002)(6306002)(9686003)(229853002)(55016002)(316002)(52536014)(5660300002)(14454004)(2940100002)(478600001)(25786009)(6636002)(966005)(110136005)(476003)(305945005)(99286004)(7736002)(2906002)(53546011)(186003)(102836004)(3846002)(6116002)(76176011)(446003)(66476007)(11346002)(4326008)(66946007)(26005)(6506007)(486006)(8676002)(71200400001)(33656002)(86362001)(74316002)(71190400001)(66066001)(64756008)(81156014)(8936002)(81166006)(66446008)(66556008)(14444005)(256004)(6246003)(7696005)(76116006)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3784;
 H:CH2PR12MB3672.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kU+Je20fSxSlJkE/ZlUCZc5FjkRSDGXlvADI7Dz3vix5+jdQBcTH/i6YtrCfnJSRewD4+sH1L5NPaJdhjVAcGuuYIHUPPbjE1SuLEl07P4A7pqxqvzsa2TpZCtbwUiEx6FNk3yzjKBvbU8DuiZaMnSmLQgfDUEMJo2KRZU4aQkAnlfTRGIG+3yLNSPC6tKtiGolmbFgqZOzBic72HWqacnsm6Y+U3ftpAxSJjZJc57npl+YbRItIDiWAKNdrblOh1sJ6xbsgHNBuktBUkxfwA0kL1Zdh+gQ7gtVbK5df8uGMyR56vs7AJtOVFPjNJU1POJgKo892yUtp82AR6Dkd7zedgZmq2/d3coQxpRntramWtCyhiZ0/QddwptPsg4z90y3AQAUjc844bboCxZcyFxfj47l+/FCc9eA6BFiKGc24uROQ9PYcXYWY0m/Q3BW8npfgueaGqdJvt00pZM56hg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82852918-afec-4c83-1c46-08d74563fbad
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 05:06:42.1130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XfjBLVEpppnNhcgIrwBN6tAw84eZ3x+2PsMzHWaihXCFI32KtMCql2sJO2u5m7QP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3784
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMKlD4GmDmxnIi0U0FkoFbbGyegLScZFxpUc1Y0ryf8=;
 b=oVD/m7gYR2XvuqdNHs0/ANoGZ9LI2JTb74+P4xrTkDATXdyDMwQOG5Tf9HcLLjKDw6jxz9upuRC1cyrcn9iGYrvxko+exxCqAiOLCO9iTxmo5YsymJevytgM6ODQeag1HieZ9c3tsb6Z8wjeD11Qe7mKacBGDpNsqQG6mhHppHU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Zhang1@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGksIGZvbGtzLA0KDQpXb3VsZCB5b3UgcGxlYXNlIGhlbHAgdG8gcmV2aWV3IHRoZSBwYXRjaD8N
Cg0KVGhhbmtzLA0KSmFjaw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1k
LWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
IEphY2sgWmhhbmcNClNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDMwLCAyMDE5IDE6MDAgUE0NClRv
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IFpoYW5nLCBKYWNrIChKaWFuKSA8
SmFjay5aaGFuZzFAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZC9hbWRncHUvc3Jp
b3YgaXAgYmxvY2sgc2V0dGluZyBvZiBBcmN0dXJ1cw0KDQpBZGQgaXAgYmxvY2sgc2V0dGluZyBm
b3IgQXJjdHVydXMgU1JJT1YNCg0KMS5QU1AgbmVlZCB0byBiZSBpbml0aWFsaXplZCBiZWZvcmUg
SUguDQoyLlNNVSBkb2Vzbid0IG5lZWQgdG8gYmUgaW5pdGlhbGl6ZWQgYXQga21kIGRyaXZlci4N
CjMuQXJjdHVydXMgZG9lc24ndCBzdXBwb3J0IERDRSBoYXJkd2FyZSxpdCBuZWVkcyB0byBza2lw
DQogIHJlZ2lzdGVyIGFjY2VzcyB0byBEQ0UuDQoNClNpZ25lZC1vZmYtYnk6IEphY2sgWmhhbmcg
PEphY2suWmhhbmcxQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jIHwgMTAgKysrKysrLS0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nv
YzE1LmMgICAgfCAxOSArKysrKysrKysrKysrKystLS0tDQogMiBmaWxlcyBjaGFuZ2VkLCAyMSBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192OV8wLmMNCmluZGV4IDk1YTlhNWY1Li40NDAyM2JkIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYw0KQEAgLTEzMzAsMTEgKzEzMzAsMTMgQEAgc3RhdGljIGludCBnbWNf
djlfMF9od19pbml0KHZvaWQgKmhhbmRsZSkNCiAJZ21jX3Y5XzBfaW5pdF9nb2xkZW5fcmVnaXN0
ZXJzKGFkZXYpOw0KIA0KIAlpZiAoYWRldi0+bW9kZV9pbmZvLm51bV9jcnRjKSB7DQotCQkvKiBM
b2Nrb3V0IGFjY2VzcyB0aHJvdWdoIFZHQSBhcGVydHVyZSovDQotCQlXUkVHMzJfRklFTEQxNShE
Q0UsIDAsIFZHQV9IRFBfQ09OVFJPTCwgVkdBX01FTU9SWV9ESVNBQkxFLCAxKTsNCisJCWlmIChh
ZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9BUkNUVVJVUykgew0KKwkJCS8qIExvY2tvdXQgYWNjZXNz
IHRocm91Z2ggVkdBIGFwZXJ0dXJlKi8NCisJCQlXUkVHMzJfRklFTEQxNShEQ0UsIDAsIFZHQV9I
RFBfQ09OVFJPTCwgVkdBX01FTU9SWV9ESVNBQkxFLCAxKTsNCiANCi0JCS8qIGRpc2FibGUgVkdB
IHJlbmRlciAqLw0KLQkJV1JFRzMyX0ZJRUxEMTUoRENFLCAwLCBWR0FfUkVOREVSX0NPTlRST0ws
IFZHQV9WU1RBVFVTX0NOVEwsIDApOw0KKwkJCS8qIGRpc2FibGUgVkdBIHJlbmRlciAqLw0KKwkJ
CVdSRUczMl9GSUVMRDE1KERDRSwgMCwgVkdBX1JFTkRFUl9DT05UUk9MLCBWR0FfVlNUQVRVU19D
TlRMLCAwKTsNCisJCX0NCiAJfQ0KIA0KIAlyID0gZ21jX3Y5XzBfZ2FydF9lbmFibGUoYWRldik7
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCmluZGV4IGRiZDc5MGUuLmFjMTgxZTMgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQpAQCAtNzU0LDE0ICs3NTQsMjUgQEAgaW50
IHNvYzE1X3NldF9pcF9ibG9ja3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogCWNhc2Ug
Q0hJUF9BUkNUVVJVUzoNCiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZ2ZWdh
MTBfY29tbW9uX2lwX2Jsb2NrKTsNCiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYs
ICZnbWNfdjlfMF9pcF9ibG9jayk7DQotCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2
LCAmdmVnYTEwX2loX2lwX2Jsb2NrKTsNCi0JCWlmIChsaWtlbHkoYWRldi0+ZmlybXdhcmUubG9h
ZF90eXBlID09IEFNREdQVV9GV19MT0FEX1BTUCkpDQotCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9j
a19hZGQoYWRldiwgJnBzcF92MTFfMF9pcF9ibG9jayk7DQorDQorCQkvKiBGb3IgTUkxMDAgU1It
SU9WLCBQU1AgbmVlZCB0byBiZSBpbml0aWFsaXplZCBiZWZvcmUgSUggKi8NCisJCWlmIChhbWRn
cHVfc3Jpb3ZfdmYoYWRldikpIHsNCisJCQlpZiAobGlrZWx5KGFkZXYtPmZpcm13YXJlLmxvYWRf
dHlwZSA9PSBBTURHUFVfRldfTE9BRF9QU1ApKQ0KKwkJCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2Nr
X2FkZChhZGV2LCAmcHNwX3YxMV8wX2lwX2Jsb2NrKTsNCisJCQlhbWRncHVfZGV2aWNlX2lwX2Js
b2NrX2FkZChhZGV2LCAmdmVnYTEwX2loX2lwX2Jsb2NrKTsNCisJCX0gZWxzZSB7DQorCQkJYW1k
Z3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnZlZ2ExMF9paF9pcF9ibG9jayk7DQorCQkJ
aWYgKGxpa2VseShhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xPQURfUFNQ
KSkNCisJCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnBzcF92MTFfMF9pcF9i
bG9jayk7DQorCQl9DQorDQogCQlpZiAoYWRldi0+ZW5hYmxlX3ZpcnR1YWxfZGlzcGxheSB8fCBh
bWRncHVfc3Jpb3ZfdmYoYWRldikpDQogCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRl
diwgJmRjZV92aXJ0dWFsX2lwX2Jsb2NrKTsNCiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRk
KGFkZXYsICZnZnhfdjlfMF9pcF9ibG9jayk7DQogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2Fk
ZChhZGV2LCAmc2RtYV92NF8wX2lwX2Jsb2NrKTsNCi0JCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tf
YWRkKGFkZXYsICZzbXVfdjExXzBfaXBfYmxvY2spOw0KKwkJaWYgKCFhbWRncHVfc3Jpb3ZfdmYo
YWRldikpDQorCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnNtdV92MTFfMF9p
cF9ibG9jayk7DQorDQogCQlpZiAodW5saWtlbHkoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09
IEFNREdQVV9GV19MT0FEX0RJUkVDVCkpDQogCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQo
YWRldiwgJnZjbl92Ml81X2lwX2Jsb2NrKTsNCiAJCWJyZWFrOw0KLS0gDQoyLjcuNA0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWls
aW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
