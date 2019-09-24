Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 029E8BC4AA
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 11:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460AE6E9D7;
	Tue, 24 Sep 2019 09:18:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820078.outbound.protection.outlook.com [40.107.82.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA956E9D7
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 09:18:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+3Gzl5LYZgeZdtvJKtZCUytaYq2K4LlTtjY49BuRMeSyJDgKIPjt/pzq5F4Jue0cqhMl7/yyQmNwltoXFAVqlB6FizTazRBr85g+jiXKizNxhlANytyubveCuOxvfjHOVlgruhb3VlL5X115w+64HYhQMq9O94hEvYqItbZYSyqvlOq2hBDMckcFdUfQ6qoK9jv1viMk+hlVgy3jhkN1J8Cd15q+2en1nFIHjg8kz1cK2TRQb2USgBeAMYJjCeHUSqUM+2jh3KIaQKN35i/N7cGJcxCYvBHhU+pA5I3muKrMDcMinZ/LXt8csxNX6qR+7ikfCw9CllWcaxyBQ2nTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+1ZLdibOGF9xCMQu/hUqPsLUvAzxQmKB6SAK2X+VY8=;
 b=bzlaLLrnqj9rpURwV3OS+Vv0+849j7B29tLnTtm5ehgMrPK51WR0eGV1L5BpM6CajoeySpTeYdOlU0qWrEOl42nVVoZY74CxnbZruAk1abASCQtU2Noo5bFMzvcvPCqL4qgi1bZPC0rXxkltctdIXn9M1Xle5mvNXjohYJ/gh1aYZOwZK8hB3KOjXGr+1tBD06hiqbwhHOmviC291mVlS6tP8Ryf6i0UYZdy86XZrRsJ/WF4R47ieW74zCN04ZsFErEVLP+LBCvxbXzpcVWMEonT7eGJBfzvhSNioI6D4T3cQ676sz8oHLIrvvUfEQKQWw92KhWq6Nuu7TcO6/D+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3248.namprd12.prod.outlook.com (20.179.80.74) by
 MN2PR12MB3967.namprd12.prod.outlook.com (10.255.238.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Tue, 24 Sep 2019 09:18:22 +0000
Received: from MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::ad48:9c35:d74d:8e20]) by MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::ad48:9c35:d74d:8e20%6]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 09:18:22 +0000
From: "S, Shirish" <Shirish.S@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH] drm/amdgpu/psp: silence response status warning
Thread-Topic: [PATCH] drm/amdgpu/psp: silence response status warning
Thread-Index: AQHVcrkCwx7KJ9fTsUG8CMN4kHpeOA==
Date: Tue, 24 Sep 2019 09:18:21 +0000
Message-ID: <1569316680-12374-1-git-send-email-shirish.s@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR01CA0093.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::33)
 To MN2PR12MB3248.namprd12.prod.outlook.com
 (2603:10b6:208:a9::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [165.204.157.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6f323cd-bd1c-434c-6ba9-08d740d0251b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3967; 
x-ms-traffictypediagnostic: MN2PR12MB3967:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB396711DD53A0578D7C2C34B5F2840@MN2PR12MB3967.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(199004)(189003)(14444005)(256004)(2906002)(316002)(6116002)(66066001)(6512007)(8676002)(478600001)(4326008)(14454004)(6436002)(3846002)(81156014)(81166006)(52116002)(66446008)(2616005)(64756008)(102836004)(186003)(4744005)(486006)(6636002)(54906003)(7736002)(110136005)(476003)(86362001)(26005)(66946007)(36756003)(305945005)(99286004)(25786009)(66556008)(386003)(8936002)(5660300002)(6506007)(71200400001)(71190400001)(50226002)(66476007)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3967;
 H:MN2PR12MB3248.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CfN9T8+7A8/Kky5Oe/A5/BcpAgHrsk3QqhybF7em4xxSyqqjIWIARKzswy1CqXNEL9Ca4AZtiDw2a2q6btHJlvee5GvsBW+KvgchlQzEDbMRTux4Dc/dwBk8Q3MMBDqK3v5h2Fsad8frlXrKpMBleklWX6ecbpcdiYStTu9r6qr0wr+NWICYQjc7rdBMQrcRohT49fTromzuFy8c0xOrK3k5JG02mWied8VyXgdpW4H2EA/qNF7ZEUhSe0sTNTRz6jV2BhtKBHua/NgB9Jy6kYsoVJJfmRo6JtMKcNUeJjRTirEUXSkpMX8hYrcxklTHk4/ZqvylsU6dWgUifxYnUhpTcbvr77h2wLE4zFWj+KrOQWGOQvq3vq/OyzMMYrsNPYCiQYPUrwLiCrY0kLgKfcEX/yeOXpi4AxUhuaQhVlI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f323cd-bd1c-434c-6ba9-08d740d0251b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 09:18:22.0591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5P0UChrROYGLcPvHU4hSrfWgEqDsEFRgfMc9dWVAIjVZ1WULgDaLiA6O+sEWft+oUsw3LayP5P7S6n//9ZhVdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3967
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+1ZLdibOGF9xCMQu/hUqPsLUvAzxQmKB6SAK2X+VY8=;
 b=sZ1pKhBAsnO3BXEtbkCFlGJlPUEymgj4ptpVI//p2qR7doYMFRIm1dLMGVubSdLbsZAIJTKw4d3bnVlhHYNDK9qNfIhG9ExX0BCIISZrhvO+LmmT97+38uLzTc0falwvjtckibPIL9ZoZdUxayLzIIJVLW7MgsZn27cAdUIiQkY=
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

bG9nIHRoZSByZXNwb25zZSBzdGF0dXMgcmVsYXRlZCBlcnJvciB0byB0aGUgZHJpdmVyJ3MKZGVi
dWcgbG9nIHNpbmNlICBwc3AgcmVzcG9uc2Ugc3RhdHVzIGlzIG5vdCAwIGV2ZW4gdGhvdWdoCnRo
ZXJlIHdhcyBubyBwcm9ibGVtIHdoaWxlIHRoZSBjb21tYW5kIHdhcyBzdWJtaXR0ZWQuCgpUaGlz
IHdhcm5pbmcgbWlzbGVhZHMsIGhlbmNlIHRoaXMgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogU2hp
cmlzaCBTIDxzaGlyaXNoLnNAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcHNwLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcHNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKaW5kZXgg
NzZjNTlkNS4uMzdmZmVkNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BzcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3Au
YwpAQCAtMTcwLDcgKzE3MCw3IEBAIHBzcF9jbWRfc3VibWl0X2J1ZihzdHJ1Y3QgcHNwX2NvbnRl
eHQgKnBzcCwKIAkJaWYgKHVjb2RlKQogCQkJRFJNX1dBUk4oImZhaWxlZCB0byBsb2FkIHVjb2Rl
IGlkICglZCkgIiwKIAkJCQkgIHVjb2RlLT51Y29kZV9pZCk7Ci0JCURSTV9XQVJOKCJwc3AgY29t
bWFuZCAoMHglWCkgZmFpbGVkIGFuZCByZXNwb25zZSBzdGF0dXMgaXMgKDB4JVgpXG4iLAorCQlE
Uk1fREVCVUdfRFJJVkVSKCJwc3AgY29tbWFuZCAoMHglWCkgZmFpbGVkIGFuZCByZXNwb25zZSBz
dGF0dXMgaXMgKDB4JVgpXG4iLAogCQkJIHBzcC0+Y21kX2J1Zl9tZW0tPmNtZF9pZCwKIAkJCSBw
c3AtPmNtZF9idWZfbWVtLT5yZXNwLnN0YXR1cyAmIEdGWF9DTURfU1RBVFVTX01BU0spOwogCQlp
ZiAoIXRpbWVvdXQpIHsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
