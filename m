Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D707EAF4AB
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 05:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B74A6E9EE;
	Wed, 11 Sep 2019 03:21:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770074.outbound.protection.outlook.com [40.107.77.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754526E9EC
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 03:21:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rqg4agCw2uNKXHwS2LyNYNM+mWQjMkYp1BzTuurjam9jQ+EK1xiDQ/EdOP+BMh56XyuVxKG5S2nl6mP3Bd1HGnN7llSf5Q9S3INOl4koQQ6GtqLCacWyhjR7JKwcnCnwygFbSTr2cZHBensrMEBpvgNkohQ7sLcg57zryUzifjN2kT4oZv/HG7U3iZ68IXLye9E+pwtPIiqtoExBAKoXEaZ0W3I5xTeSGMrOu9t/WdDwPbJArusMwMftvBTOJykk6JnigtfXGKYy5sP3aNO45lqYNcTrA9igOMLk36DPz9ft1UQ/nVs8Hl7/9Sc+TURtrco3dc6qJw+H72qA+AJrdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ComV0q+Hc4GDCl47LpfsZHk7GtsZ7eFt3Dpmx/JEK0=;
 b=AUooUEfCOB9MHrSTPWb/1RQ845cJKH314nQB1aIG9ToBFleKuyEAQQnG/QZ81ICI7qSY0zUT01Mxx5p9Ny4nC5kMsyamk5Lwne8WcNjYSIL1d2hahAkvwFtq9BdrqXr/MxLPzc5J1qicCbN/QzdBfW5NmlVlxA9XxiqcU/tsa5r9YpMg+nQME8SpgQEEKZUJkFu9t0wJMfkAGRDbICaL2KbxVLZ4wgsiEmVrkDvQL3C1p6iucDnxkadWXsGs2pkNZdwO1i26tn5frahAr9BU/5m/S57b5tbOlLGX5Qn1yHcr9MbncpDRIWIzu/kyq/NzaNeMJ7hDlWl0PZ9rEpOxkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB2726.namprd12.prod.outlook.com (20.177.124.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Wed, 11 Sep 2019 03:21:12 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 03:21:12 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 4/4] drm/amdgpu: implement ras query function for pcie bif
Thread-Topic: [PATCH 4/4] drm/amdgpu: implement ras query function for pcie bif
Thread-Index: AQHVaE/2KgXUg3myXkGsil1ytThxUg==
Date: Wed, 11 Sep 2019 03:21:11 +0000
Message-ID: <20190911032016.10313-5-guchun.chen@amd.com>
References: <20190911032016.10313-1-guchun.chen@amd.com>
In-Reply-To: <20190911032016.10313-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0088.apcprd04.prod.outlook.com
 (2603:1096:202:15::32) To BYAPR12MB2806.namprd12.prod.outlook.com
 (2603:10b6:a03:70::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59a2baa0-c71d-4159-9700-08d736671889
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2726; 
x-ms-traffictypediagnostic: BYAPR12MB2726:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2726D5B5D2C62001F8713B19F1B10@BYAPR12MB2726.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:207;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(199004)(189003)(102836004)(99286004)(66476007)(110136005)(316002)(54906003)(6436002)(11346002)(76176011)(26005)(305945005)(7736002)(446003)(6512007)(52116002)(36756003)(66946007)(71190400001)(71200400001)(86362001)(8936002)(5660300002)(81166006)(53936002)(81156014)(50226002)(8676002)(2501003)(1076003)(256004)(6116002)(14454004)(6506007)(6486002)(3846002)(2616005)(66556008)(386003)(486006)(25786009)(476003)(186003)(4326008)(66066001)(478600001)(66446008)(64756008)(6636002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2726;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TLzTjgJnbXdQuv//9cbiQ5dKkHHoJBhJkgp17Q0a3GK2rEA4mlVnS/rP+6PxycBsPUlq9JP+g9iiaFXjglwosG1VXWd4frK/lE+kf6TwfVoa/TETPRKUXxA9Vl7GANo32eNZPdY9AARFW/E6FZZ3q86nxgf2Ps/6l+MxnDME8TEsCEXQc157I5tf/s0S0Btpr5Zq24wQQGuowbb+IvJz6eo5llW1KRAV0N7IFK+BaoMvSwc/X820xdVX5USP4ImFkzusy1G2TiOXntW6BRZPoRfYKlW9EVhsH/t0MZzxcVa5NerLyA52oZ9a+53eijXU7fRWfsgUIJWABPWUs735UzJBmFBfQmxfo/rUxIfrIZcZn1lrU/NOV5laPxKTMfzOC4u5GDiqHLJed3BzJJdtJPfdt3VcXiXDVCt/S/+BPBs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a2baa0-c71d-4159-9700-08d736671889
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 03:21:11.8945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mwDn+/9ly19DxVXGRH+yxWjyNLZuZpReSp5sJQWbjS2e2h0Z6Ymi2SQHo0siQIUVimNMeoWQaWib70ez9o+9YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2726
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ComV0q+Hc4GDCl47LpfsZHk7GtsZ7eFt3Dpmx/JEK0=;
 b=w/YOe/5YJn5LlWOQ7uiwzqhgtQe9+UEZFHriYpiZ7IxWhLHdjWLLeSMusNEV9mNnJ/oKLFc2DEXKPch7ak+vr+i7IRaAz88PAzb2Nm7KrKa5tnz6ArwVWKDw1x8qGcEPV44HM8J5FvRcNzG9uqpP1cKfaU0hymnLGZc4p9c1PpM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Li, Candice" <Candice.Li@amd.com>, "Chen,
 Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cmFzIGVycm9yIHF1ZXJ5IGZ1bnRpb25hbGl0eSBpbXBsZW1lbnRhdGlvbgoKQ2hhbmdlLUlkOiBJ
ZDdkOGMzNTYyMTk2MDY4NWEyYTc1MDdlNGU5NTkzOWY1YTA1YmRjNgpTaWduZWQtb2ZmLWJ5OiBU
YW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEd1Y2h1biBDaGVuIDxn
dWNodW4uY2hlbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9f
djdfNC5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAz
MCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bmJpb192N180LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYwppbmRl
eCBmYTZhODkxOGRjOGMuLmI3NzYzMzJkOTc5ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbmJpb192N180LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bmJpb192N180LmMKQEAgLTQ3Niw2ICs0NzYsMzYgQEAgc3RhdGljIGludCBuYmlvX3Y3XzRfaW5p
dF9yYXNfZXJyX2V2ZW50X2F0aHViX2ludGVycnVwdCAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmEK
IHN0YXRpYyB2b2lkIG5iaW9fdjdfNF9xdWVyeV9yYXNfZXJyb3JfY291bnQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsCiAJCQkJCXZvaWQgKnJhc19lcnJvcl9zdGF0dXMpCiB7CisJdWludDMy
X3QgZ2xvYmFsX3N0cywgY2VudHJhbF9zdHMsIGludF9lb2k7CisJdWludDMyX3QgY29yciwgZmF0
YWwsIG5vbl9mYXRhbDsKKwlzdHJ1Y3QgcmFzX2Vycl9kYXRhICplcnJfZGF0YSA9IChzdHJ1Y3Qg
cmFzX2Vycl9kYXRhICopcmFzX2Vycm9yX3N0YXR1czsKKworCWdsb2JhbF9zdHMgPSBSUkVHMzJf
UENJRShzbW5SQVNfR0xPQkFMX1NUQVRVU19MTyk7CisJY29yciA9IFJFR19HRVRfRklFTEQoZ2xv
YmFsX3N0cywgUkFTX0dMT0JBTF9TVEFUVVNfTE8sIFBhcml0eUVyckNvcnIpOworCWZhdGFsID0g
UkVHX0dFVF9GSUVMRChnbG9iYWxfc3RzLCBSQVNfR0xPQkFMX1NUQVRVU19MTywgUGFyaXR5RXJy
RmF0YWwpOworCW5vbl9mYXRhbCA9IFJFR19HRVRfRklFTEQoZ2xvYmFsX3N0cywgUkFTX0dMT0JB
TF9TVEFUVVNfTE8sCisJCQkJUGFyaXR5RXJyTm9uRmF0YWwpOworCisJaWYgKGNvcnIpCisJCWVy
cl9kYXRhLT5jZV9jb3VudCsrOworCWlmIChmYXRhbCkKKwkJZXJyX2RhdGEtPnVlX2NvdW50Kys7
CisKKwlpZiAoY29yciB8fCBmYXRhbCB8fCBub25fZmF0YWwpIHsKKwkJY2VudHJhbF9zdHMgPSBS
UkVHMzJfUENJRShzbW5CSUZMX1JBU19DRU5UUkFMX1NUQVRVUyk7CisJCS8qIGNsZWFyIGVycm9y
IHN0YXR1cyByZWdpc3RlciAqLworCQlXUkVHMzJfUENJRShzbW5SQVNfR0xPQkFMX1NUQVRVU19M
TywgZ2xvYmFsX3N0cyk7CisKKwkJaWYgKFJFR19HRVRfRklFTEQoY2VudHJhbF9zdHMsIEJJRkxf
UkFTX0NFTlRSQUxfU1RBVFVTLAorCQkJCUJJRkxfUmFzQ29udGxsZXJfSW50cl9SZWN2KSkgewor
CQkJLyogY2xlYXIgaW50ZXJydXB0IHN0YXR1cyByZWdpc3RlciAqLworCQkJV1JFRzMyX1BDSUUo
c21uQklGTF9SQVNfQ0VOVFJBTF9TVEFUVVMsIGNlbnRyYWxfc3RzKTsKKwkJCWludF9lb2kgPSBS
UkVHMzJfUENJRShzbW5JT0hDX0lOVEVSUlVQVF9FT0kpOworCQkJaW50X2VvaSA9IFJFR19TRVRf
RklFTEQoaW50X2VvaSwKKwkJCQkJSU9IQ19JTlRFUlJVUFRfRU9JLCBTTUlfRU9JLCAxKTsKKwkJ
CVdSRUczMl9QQ0lFKHNtbklPSENfSU5URVJSVVBUX0VPSSwgaW50X2VvaSk7CisJCX0KKwl9CiB9
CiAKIGNvbnN0IHN0cnVjdCBhbWRncHVfbmJpb19mdW5jcyBuYmlvX3Y3XzRfZnVuY3MgPSB7Ci0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
