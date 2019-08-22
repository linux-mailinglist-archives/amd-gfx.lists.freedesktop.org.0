Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D47F19931F
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 14:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635196EB05;
	Thu, 22 Aug 2019 12:19:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790072.outbound.protection.outlook.com [40.107.79.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9D76EB05
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 12:19:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVm4TsUNXqtlNkw+E2vIOm+u8Z/o2rtmAhlrYP+kxx3cYE0V9NE1gDceY4gOiETrGHYuQHKBV6JvK9piZ6apqI4qbbx8yeJ/M7G3oT3UNqNvwar8IQuaGH0uZpBU/aNfET27m0+kfgKOGpBoM3NlqaTNStegLl2fwp0LIPG44eJ1JDcWQK+6TBW7u5KdjKGFkBDVVPv6VCqUgB2O6hfCUZIRcB1nv0T2ODe1ktVqFT1Qks4CGsl+yTi3z5YPoHG74N1IAP/ykRSOxmiqyS5bzTtIHawZg1HpEMTX/qCe4mkeOVnEdghyI85erW6o94PksuUTaabHXrr+NNycdQ6uYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuxSB2VgqYbj+1mVZKRoFWZNjDNu+eeWXCCpua0UEoM=;
 b=gNVRULKGNsFN0qcqGQ9luNAJ6oqkTmJA2fDNVm8f0apAKnr282vMMa2EE9JR2DqXvtjVQOojXBzTnNPRLeu9SMr7H3yHbC9bWay9mr5J39k17zgZL2Q72NV3X/Pgl989eb5KSt6ElMraZDiwVB5HXWWpA9CEElE3DixRMoUggutAMdSLXHrKbw+nXstS4+HlOS5C8olSkgZzny8vjn0KSYcG3mC9k+WzA7QJhTP0pxBPPXIw+/l8vqjQOmVOjyj9dCnZb11onDKcgD34TBu3q+WBxv2Dbrmf7kD0u+94VsCtiF4okgZAfFi5BDwhYP5FFeRBtcbVweD+ap6pJF4n+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1667.namprd12.prod.outlook.com (10.172.18.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 22 Aug 2019 12:19:39 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::4d5d:1a87:aac9:d7b2]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::4d5d:1a87:aac9:d7b2%10]) with mapi id 15.20.2178.020; Thu, 22 Aug
 2019 12:19:39 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fix Vega20 Average Power value
Thread-Topic: [PATCH] drm/amdgpu: Fix Vega20 Average Power value
Thread-Index: AQHVWOPefElQedQbPkSP96p3P9pH+A==
Date: Thu, 22 Aug 2019 12:19:39 +0000
Message-ID: <20190822121927.32609-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTXPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::38) To BN6PR12MB1618.namprd12.prod.outlook.com
 (2603:10b6:405:b::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08d553b8-034c-41bb-5db4-08d726fb00e7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1667; 
x-ms-traffictypediagnostic: BN6PR12MB1667:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1667B6F34FC8851DD01AE9EB85A50@BN6PR12MB1667.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(199004)(189003)(7736002)(66066001)(305945005)(2501003)(256004)(2351001)(71190400001)(71200400001)(36756003)(486006)(386003)(6506007)(476003)(186003)(2616005)(1076003)(102836004)(86362001)(26005)(64756008)(6486002)(66556008)(6436002)(66446008)(66946007)(52116002)(81156014)(99286004)(8676002)(50226002)(8936002)(2906002)(316002)(4326008)(25786009)(14454004)(478600001)(3846002)(6512007)(6916009)(81166006)(5660300002)(5640700003)(53936002)(6116002)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1667;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EOdMkz2LYFzV8wDd18rrIioIB820n5U4Jy36F77cELFf0Rbtt9TW8m8MIZHdn5QroW3uuDTkOddFSW6l0dmc4nTalOtdt3X+gAiA1D9JlQBnOCEIW0apvwOcJxTx1LrJ++u0arz8BH96TGID/m6JalaQKn2LtBWFeAIPGiHa/EsUwCYGPBSq0kwZGsgR0+NDgLybs14y7CdNuHVoAr4dJH962tni4DYkRtAQwootnHdY0/kGHuUWQoXSxf5v8ptlrVMuYhuey5eWQHLq8qzc4quuvwrAC2Yah1+TjF1xTpox0dq7IdZQNfRRIJOPJX6NsDL0wXJ7MYVMDFw4AdBPG8nNWlfC54M+/jDOpTy5xcOM8G06eaezToj0iae+ChOgQNFlZVzH0W4pO8fCYOfmXs+gRTjKi0U0oH+orID8pDE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d553b8-034c-41bb-5db4-08d726fb00e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 12:19:39.2912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GeGcfR0jZ5u69AY9qszIJLRwnD3ZUuioejgvW8YcmND95tWDa+ouoCa74pg+JZGL/8xOzeD6q3536k5/swFKkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1667
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuxSB2VgqYbj+1mVZKRoFWZNjDNu+eeWXCCpua0UEoM=;
 b=J71O/kCSZge2uGMKIh9rg8FOA6P6THKJXuweS9F6VGQ0TEjjDgnOoNcCTmAdLWHbtA+SidLRUPuRgYWZDfxFl7EHbluvSCdC43v7kXhKefMSi4IJncsiL5xqAniFDpLHIa4heomGEJJyLK/6xrjtgvXk6P8TBNGuRv214apl6+I=
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

VGhlIFNNVSBjaGFuZ2VkIHJlYWRpbmcgZnJvbSBDdXJyU29ja2V0UG93ZXIgdG8gQXZlcmFnZVNv
Y2tldFBvd2VyLCBzbwpyZWZsZWN0IHRoaXMgYWNjb3JkaW5nbHkuIFRoaXMgZml4ZXMgdGhlIGlz
c3VlIHdoZXJlIEF2ZXJhZ2UgUG93ZXIKQ29uc3VtcHRpb24gd2FzIGJlaW5nIHJlcG9ydGVkIGFz
IDAgZnJvbSBTTVUgNDAuNDYtb253YXJkCgpDaGFuZ2UtSWQ6IEk0NzFmOTMzMTY4MjBmMTQwMWNi
NDk3ZWVmZTI5ZGE2ODM3NmE0YmI5ClNpZ25lZC1vZmYtYnk6IEtlbnQgUnVzc2VsbCA8a2VudC5y
dXNzZWxsQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Iv
dmVnYTIwX2h3bWdyLmMgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdh
MjBfcHB0LmMgICAgICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
aHdtZ3IvdmVnYTIwX2h3bWdyLmMKaW5kZXggMDUxNmMyOTRiMzc3Li4xODIwMTMzZjBjZWIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21n
ci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21n
ci5jCkBAIC0yMTAxLDcgKzIxMDEsNyBAQCBzdGF0aWMgaW50IHZlZ2EyMF9nZXRfZ3B1X3Bvd2Vy
KHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCSpx
dWVyeSA9IG1ldHJpY3NfdGFibGUuQ3VyclNvY2tldFBvd2VyIDw8IDg7CisJKnF1ZXJ5ID0gbWV0
cmljc190YWJsZS5BdmVyYWdlU29ja2V0UG93ZXIgPDwgODsKIAogCXJldHVybiByZXQ7CiB9CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKaW5kZXggZTE0MzYzMTgy
NjkxLi4xN2FmMTJlZTllNzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L3ZlZ2EyMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdh
MjBfcHB0LmMKQEAgLTI5MjcsNyArMjkyNyw3IEBAIHN0YXRpYyBpbnQgdmVnYTIwX2dldF9ncHVf
cG93ZXIoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90ICp2YWx1ZSkKIAlpZiAocmV0
KQogCQlyZXR1cm4gcmV0OwogCi0JKnZhbHVlID0gbWV0cmljcy5DdXJyU29ja2V0UG93ZXIgPDwg
ODsKKwkqdmFsdWUgPSBtZXRyaWNzLkF2ZXJhZ2VTb2NrZXRQb3dlciA8PCA4OwogCiAJcmV0dXJu
IDA7CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
