Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6163C68A06
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 14:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B3189700;
	Mon, 15 Jul 2019 12:54:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700080.outbound.protection.outlook.com [40.107.70.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C2489700
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 12:54:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONL477EEk7czWFOI3WcDeV6GNTeJUZ0zw1EWMmCn3Eos5sTpgmIaSXfgjZBosvCLV0RSs9L19Qf24H4Y4KA77sugez/X1DxP/Nw+enZoty1mqefiCEm/I49C8lzw4+IQ0erZsETAYocwIVHMufEkPq1Ro7WkEEqqakzFpiv0c9pcvxManteSvGPqybS7NSs4X3I17v8DGgZKAZQyr5tc7KsMrjxwkboeCbgDxatiATO9NRZH0/ffnAURUKEnaMWm7vPamYa2LR+1AzNqTKpZZxQj/4V1zv7ziGVaQJsvV1e6aA1jDr/UezAKY1oZBx/ReQqDnfqlma9natSZAHwePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MF6mb390uA5piZFcRJ38ittI3lFDRzki05nk/ppHNxI=;
 b=XtcmmpSO+SN6b+NZccsbpbSnBvw/OVJo5neDP/hfwdE1zMC1rZmBosGxudg5g8GjYMdmirqU9QYoJsHWbuziFTlZCnFvRM1JoZi2Zw4udImYXbeZf4ZtivLwnds346Mb+Jit2lSWUYMGn0wC821it/QzypmXkP2t1LZdLyS53HCSkhQxXgyUofvI12JVZRzykgESv006nL3hGI6VOqPJbxFEvxyiRurFwAD8VgBHc8SQ+yoTfevXniRk8YRDRhX2Fb07rN8dIALGj55qJ3pMaA0BCyKEmBUoq3AMJiZ/AvIHj5KJJOeb84ufLF5ehpzh1yfZUBG8hBiPeJiwPf6Vew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1892.namprd12.prod.outlook.com (10.175.102.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 12:54:50 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::9134:e36a:9204:a483]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::9134:e36a:9204:a483%4]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 12:54:50 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fix Vega20 Perf counter for pcie_bw
Thread-Topic: [PATCH] drm/amdgpu: Fix Vega20 Perf counter for pcie_bw
Thread-Index: AQHVOwx95KoFcK6U40SzCiGlQLiCGQ==
Date: Mon, 15 Jul 2019 12:54:50 +0000
Message-ID: <20190715125423.30613-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YT1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::18)
 To BN6PR12MB1618.namprd12.prod.outlook.com
 (2603:10b6:405:b::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32e0b15e-283d-4af4-e4b5-08d709239f89
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1892; 
x-ms-traffictypediagnostic: BN6PR12MB1892:
x-microsoft-antispam-prvs: <BN6PR12MB18922B42F5184B47C7E09CD785CF0@BN6PR12MB1892.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(199004)(189003)(102836004)(6506007)(386003)(1076003)(53936002)(6486002)(71190400001)(71200400001)(50226002)(2351001)(36756003)(52116002)(2501003)(66556008)(66476007)(486006)(86362001)(2906002)(305945005)(6916009)(99286004)(5660300002)(66446008)(64756008)(66946007)(26005)(6436002)(66066001)(2616005)(476003)(478600001)(8676002)(316002)(25786009)(6116002)(186003)(3846002)(68736007)(81166006)(8936002)(81156014)(7736002)(256004)(4326008)(14454004)(5640700003)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1892;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XIeIgVJKMCHmcn2wIYY5870OQMO38Oc1SAiFD/jKTYIxrH+Pyy+knFBfCKIhSamOp7VC8m+JMO58Oct1OhziCsnw7Q62zF1UWpohIhFpjErCYycLm1nh5j82A7eyi5lC/5u+FhyRhGOdmwe1A1ijIUApQGbuMiXSNNcn7oKFrPPJg/jeslM57mZsZ2cj2Xos9dncrqqRRfvvPW+codlt++y/ZfhGzN21d5GVTLkTjz6FBdzWkrAI4wicdpqOvMVcXcXkyr6G7nlb8DJgvdKAhkTKRivhm4V6qh3XI9We1vjKG12HSpoiJXa5uZEuj3uloC+b1DQQdEc68m4Ct14TR8SFNnRpVYSA758NxNk8sYVrdXrofiWQjOwU4Z7eTgE8fR4SbkDG6/DnSFV27MWX/0HTO0xIHfUJF8FAkMJ9sDc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e0b15e-283d-4af4-e4b5-08d709239f89
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 12:54:50.4792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krussell@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1892
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MF6mb390uA5piZFcRJ38ittI3lFDRzki05nk/ppHNxI=;
 b=A/8QnOQXVyL+Tcf04uxBrSB1RzPtK+1bCoFwXoeFf/zYolyEpbTWea+Wa1V0d7oGP6UnNG5Hln/AtD8wSLrPhUE8LC13wUfk1T8J2eBzYzDj53T45HsV6Xr7kwpy0q14tOQgkq8jGC1iNINqla+KiqVR31z49by4M7hIzVdwETA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kent.Russell@amd.com; 
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
Cc: "Russell, Kent" <Kent.Russell@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHBlcmYgY291bnRlciBmb3IgVmVnYTIwIGlzIDEwOCwgaW5zdGVhZCBvZiAxMDQgd2hpY2gg
aXQgd2FzIG9uIGFsbApwcmV2aW91cyBHUFVzLCBzbyBhZGQgYSBjaGVjayB0byB1c2UgdGhlIGFw
cHJvcHJpYXRlIHZhbHVlLgoKQ2hhbmdlLUlkOiBJZDViNTAyNmEwM2IwOWQ4YjlkNTJkZGE4NWUx
N2VkNWFjZDgxODkxMgpTaWduZWQtb2ZmLWJ5OiBLZW50IFJ1c3NlbGwgPGtlbnQucnVzc2VsbEBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgfCAxMCArKysr
KysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IDFlNDI0ZDkxODMzNC4uODUyYWQwYTA3
OTk1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAgLTcxNiw5ICs3MTYsMTUgQEAg
c3RhdGljIHZvaWQgc29jMTVfZ2V0X3BjaWVfdXNhZ2Uoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsIHVpbnQ2NF90ICpjb3VudDAsCiAJCXJldHVybjsKIAogCS8qIFNldCB0aGUgMiBldmVudHMg
dGhhdCB3ZSB3aXNoIHRvIHdhdGNoLCBkZWZpbmVkIGFib3ZlICovCi0JLyogUmVnIDQwIGlzICMg
cmVjZWl2ZWQgbXNncywgUmVnIDEwNCBpcyAjIG9mIHBvc3RlZCByZXF1ZXN0cyBzZW50ICovCisJ
LyogUmVnIDQwIGlzICMgcmVjZWl2ZWQgbXNncyAqLwogCXBlcmZjdHIgPSBSRUdfU0VUX0ZJRUxE
KHBlcmZjdHIsIFBDSUVfUEVSRl9DTlRMX1RYQ0xLLCBFVkVOVDBfU0VMLCA0MCk7Ci0JcGVyZmN0
ciA9IFJFR19TRVRfRklFTEQocGVyZmN0ciwgUENJRV9QRVJGX0NOVExfVFhDTEssIEVWRU5UMV9T
RUwsIDEwNCk7CisJLyogUHJlLVZHMjAsIFJlZyAxMDQgaXMgIyBvZiBwb3N0ZWQgcmVxdWVzdHMg
c2VudC4gT24gVkcyMCBpdCdzIDEwOCAqLworCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9W
RUdBMjApCisJCXBlcmZjdHIgPSBSRUdfU0VUX0ZJRUxEKHBlcmZjdHIsIFBDSUVfUEVSRl9DTlRM
X1RYQ0xLLAorCQkJCQlFVkVOVDFfU0VMLCAxMDgpOworCWVsc2UKKwkJcGVyZmN0ciA9IFJFR19T
RVRfRklFTEQocGVyZmN0ciwgUENJRV9QRVJGX0NOVExfVFhDTEssCisJCQkJCUVWRU5UMV9TRUws
IDEwNCk7CiAKIAkvKiBXcml0ZSB0byBlbmFibGUgZGVzaXJlZCBwZXJmIGNvdW50ZXJzICovCiAJ
V1JFRzMyX1BDSUUoc21uUENJRV9QRVJGX0NOVExfVFhDTEssIHBlcmZjdHIpOwotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
