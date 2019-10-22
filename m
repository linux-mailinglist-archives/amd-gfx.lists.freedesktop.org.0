Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DB9E06B0
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 16:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0B988503;
	Tue, 22 Oct 2019 14:49:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770082.outbound.protection.outlook.com [40.107.77.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A64A88503
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 14:49:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBZ/N6hs5hJU1rf+jHYLTc8WhXGOoPquEcxHk0BSK090EYQ6KipSDc1CcAd6FTIONjF1hisoH54gG4g6yU40qJ9UiSuXRk4OZBhT+y+xKOaP1gl62Dt/eaNIfYeKRl5lzvdS45QH/EEEUuOqOe8KnNiNYFtfbf4eankA1/ktC2f9jB9yFaPoN8ICGiz7S1X6Uq4kmHS7wAkGVFuDBBlvX0A8RqnvvOmItfNvnuYhS8GJ4XrsD0rP+04QFTe3Gr1jxWePnvFyf+JS9whDOVijWfcCLgB6k+kCLctShvSiSDZHakUHDQWieVCZgwKJyXFmWplHsCgQNGmTvPomDEya2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7B8Ktv+UzYORs4EFGM+CUaKT0YAXcGrU9tYhhqQbXCE=;
 b=R9L5EQXcu7LmcdmK5Ve41s0+5Br/mBdWxEUgiuPGDA3AvqpBvFCbGtUZvUcgt2pUOabQC+fsLW1uLx07L1BEGMO3mC55eH9X+2mRl1BNqQJFExZp5SzcRwPusbcZVsQFTwNvRTI8pnTQfXTFCpiRsaWCGLLHNv/+AmnJtBokvYIvQDqBOsIVE/cg+w5wYF0AfCAmMPeIbAdE7SFbHXT83KSY1dhMChGfa3R35OT8ik3cNzwovifbnxsuNmnOxVvmnFl0SU+ufRPE7K/zhO4Hjyj9XHO/DDZgvvtafU6pGvJK6iH6JpJtR0qlXmAuL9LLHEmcPndb7Zzp+GtI4UJhPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR12MB1254.namprd12.prod.outlook.com (10.168.169.17) by
 CY4PR12MB1941.namprd12.prod.outlook.com (10.175.59.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 14:49:07 +0000
Received: from CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add]) by CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add%11]) with mapi id 15.20.2347.029; Tue, 22 Oct
 2019 14:49:07 +0000
From: "Zhu, James" <James.Zhu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/vcn: Enable VCN2.5 encoding
Thread-Topic: [PATCH] drm/amdgpu/vcn: Enable VCN2.5 encoding
Thread-Index: AQHViOfa3EMIa6k/q0ePItLmq/KJzw==
Date: Tue, 22 Oct 2019 14:49:06 +0000
Message-ID: <1571755708-12173-1-git-send-email-James.Zhu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16)
 To CY4PR12MB1254.namprd12.prod.outlook.com
 (2603:10b6:903:41::17)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 483605fb-383c-450a-fdfc-08d756fefd25
x-ms-traffictypediagnostic: CY4PR12MB1941:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB1941725EB110F4F944E75853E4680@CY4PR12MB1941.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(199004)(189003)(2616005)(476003)(102836004)(186003)(6436002)(26005)(81156014)(81166006)(52116002)(50226002)(6512007)(486006)(8936002)(99286004)(7736002)(36756003)(6486002)(305945005)(4744005)(8676002)(2501003)(14454004)(5660300002)(478600001)(4326008)(25786009)(2351001)(316002)(2906002)(6116002)(86362001)(66066001)(256004)(66946007)(6916009)(6506007)(5640700003)(3846002)(66476007)(66446008)(71200400001)(71190400001)(64756008)(66556008)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1941;
 H:CY4PR12MB1254.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nnQiZjSoHg91NBLQv9ka9fLvOEwNzFSLo7TmMDzZDI5kNL/YhWV+BRAQJKtfzz0H/2sKTJ3REDjUa8YWKy2s29vyjZ0FWEX22RnZSGZp+ZQaQu04bfyVxHup3yR9jp6qDdDS6CJSsG8RHDCGzf7YX5k82xEEdkCppYkhlvHi3LIT7Fz/+22GRx8iF+kyeM27p8eAUVvQp+WAZFvjpo8XhY75JwcEHYKfTxLF3eHfwM/2mfodIdKYyttsynb1Zz11uzWi23Fz6Kimcb+sxNwhxjiUmQNOmgdRpNyCCj7GsdeFu2gRTtEvNWAKhTl/w13kZ+ESyNB/imHy4GYmFdf5LU8tB7rXaskOxkKj1ydRY6LuSDHsIiqT/7GMt8B/JtICi3vExi+PjoTDQnCtTkuAVr2crSrZcN7OtJsD1qNLCoFu4DzbUK4VfppSreWwQMIj
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 483605fb-383c-450a-fdfc-08d756fefd25
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 14:49:06.9449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ldKdL2+MN1T/R9lZKu0P9Vh0Khbr/C0b/l1NHLNV01KHigXjZc23EfXPPTArtE9f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1941
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7B8Ktv+UzYORs4EFGM+CUaKT0YAXcGrU9tYhhqQbXCE=;
 b=tKPTZp4v29gVU0FnmjTk4Njz9PGFs5hw0hZv971mBiyCERyixy/L4KOlJKCQYVI59BzH9rHGO8RTYWfa7Ame3XAriyT97bP/xAaiHqbQA1Uc+CMiR6wdMuhR+FYzxtPtXEYNU0mvBdW2MKlc6O9pyaoBh/DdxcDNeVvd+JLfSHQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=James.Zhu@amd.com; 
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
Cc: "Zhu, James" <James.Zhu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWZ0ZXIgVkNOMi41IGZpcm13YXJlIChWZXJzaW9uIEVOQzogMS4xICBSZXZpc2lvbjogMTEpLApW
Q04yLjUgZW5jb2RpbmcgY2FuIHdvcmsgcHJvcGVybHkuCgpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBa
aHUgPEphbWVzLlpodUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zj
bl92Ml81LmMgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMKaW5kZXggZDI3MGRmOC4uZmY2Y2M3NyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jCkBAIC0yNjUsOSArMjY1LDYgQEAgc3RhdGlj
IGludCB2Y25fdjJfNV9od19pbml0KHZvaWQgKmhhbmRsZSkKIAogCQlmb3IgKGkgPSAwOyBpIDwg
YWRldi0+dmNuLm51bV9lbmNfcmluZ3M7ICsraSkgewogCQkJcmluZyA9ICZhZGV2LT52Y24uaW5z
dFtqXS5yaW5nX2VuY1tpXTsKLQkJCS8qIGRpc2FibGUgZW5jb2RlIHJpbmdzIHRpbGwgdGhlIHJv
YnVzdG5lc3Mgb2YgdGhlIEZXICovCi0JCQlyaW5nLT5zY2hlZC5yZWFkeSA9IGZhbHNlOwotCQkJ
Y29udGludWU7CiAJCQlyID0gYW1kZ3B1X3JpbmdfdGVzdF9oZWxwZXIocmluZyk7CiAJCQlpZiAo
cikKIAkJCQlnb3RvIGRvbmU7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
