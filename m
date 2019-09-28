Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E7BC0F86
	for <lists+amd-gfx@lfdr.de>; Sat, 28 Sep 2019 05:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6F46E136;
	Sat, 28 Sep 2019 03:41:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820079.outbound.protection.outlook.com [40.107.82.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88976E0D3
 for <amd-gfx@lists.freedesktop.org>; Sat, 28 Sep 2019 03:41:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npFF1j1pLGrOyzyzJxNhRu0gMMFqsiPbEOQvXiMYzDXtvtJ4wVIiKG0CM8+eFQEHGLgalwBcCBJLQoFS6waCjFZgLb5Ge246YCO0dKB64qs1nYhDzpAZB57UaiV1E2VBjyNv4anzpt3bE2tuGy8wQfLXc9qXRvYtFPYQVCqLOnOJhgO0KOIY3vzGlkU6QDzBk6SIAYVcIS/KRczfd9V82bhgzbrsd+Aj4mwkQRUbyY3mQ/OU5VkSMluCDjTaFExAvlS7nPFZs4Bk/mt+6TuyFEec4Lz5RG0rlN4g9qbm6BjYPxzSV8rrcWmNYkJcm34uC685AG2bILHcyAJgTOBFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVzl1EJoECpJtkjeqw5uBExeyAwA1NeiV41Fe1xW2N8=;
 b=N/NS0+gKFOEwJLDTCw2IUMMNQYs0vuHd6243WM2gyk9+pJuZr9G1UdwbON+e91xweMJbyR4J2FB4F4pyx04GLkK97clDvlUMBchPxAU+MwTmhhncjQ2icJNwN1auWoWthb5EIk18LrGHZlzqhq09E2ezf2bF3VH18WdrDzSrT7gSfScDbnXkxhXam+zEajWKEHMro17HWuNl2Ew7cxrvR3zrjt+GbpGYYKOM2dUZd/5BUVqVkRcdEwBtcUSW6Rt+dXKtoK37liACAcQRkpgOBsmLSz83auOZqlNv2c/lkDGy0Ok+dCZ8Q/eWw+XOvaCAvt4SqNt23FAiw2YD512ElA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB2809.namprd12.prod.outlook.com (20.176.117.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.18; Sat, 28 Sep 2019 03:41:47 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.028; Sat, 28 Sep 2019
 03:41:47 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 6/6] drm/amdkfd: Improve KFD IOCTL printing
Thread-Topic: [PATCH 6/6] drm/amdkfd: Improve KFD IOCTL printing
Thread-Index: AQHVda6nHHAsC5kwB06otUer7ZPNMA==
Date: Sat, 28 Sep 2019 03:41:47 +0000
Message-ID: <20190928034132.28340-6-Yong.Zhao@amd.com>
References: <20190928034132.28340-1-Yong.Zhao@amd.com>
In-Reply-To: <20190928034132.28340-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::20) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 668d8d06-adf9-4f4c-9c64-08d743c5c9f6
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB2809:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB280972E2CB21E3E3795A69AEF0800@DM6PR12MB2809.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:328;
x-forefront-prvs: 0174BD4BDA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(199004)(189003)(6486002)(26005)(50226002)(14444005)(2906002)(2351001)(6436002)(8936002)(5660300002)(186003)(7736002)(81166006)(256004)(102836004)(5640700003)(8676002)(6916009)(305945005)(66066001)(81156014)(3846002)(4326008)(25786009)(6116002)(71190400001)(71200400001)(2501003)(66446008)(6512007)(66556008)(66476007)(86362001)(2616005)(36756003)(1076003)(476003)(386003)(99286004)(11346002)(76176011)(478600001)(446003)(64756008)(6506007)(316002)(66946007)(14454004)(52116002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2809;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kWv5OzIuLi55lhVAV6RZ66xgCgNeSsjCnhS6/bOtqMOn2sLEyC7DbcUEmDW/rHc827OoK0hjdmJzsGdJoyyPWqkXbhTPHo8/F5DoRJyX5gjX/kzMSBDxPvyNCjo2noZr1uTTrPbVNJ0rkN3OgnZDeJE7KCq1K0fpzWzWWEBkgfVPVpliXhebuixBG9OJZcQszieRQOF+wsHTCvu3g6HDnjXmfZI6DUUaOghEArB0JPt41iD1iZ3CvhdkQvscwtTrwARpwN3JMdRo37o29unu7nBlpmtznmRA3ws1PX01sK1C58DS45HLZBNfFIEbYteuNVD/o1jYRYFlHiLMHxas5zMCP9crdbpjL32C9FS99+dj6TxwHPOeuJk+X1S/YTUqrVJcjxPtkwJ9AgWnA2tRzshYcQSlf3TnxifpcMAL6Bc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 668d8d06-adf9-4f4c-9c64-08d743c5c9f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2019 03:41:47.5093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5jlxbiiBdmAp0+p8MmmW/gRFznkoX36MBxLnLnjpJBwuozqs6hbmd8krXKVYopVT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2809
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVzl1EJoECpJtkjeqw5uBExeyAwA1NeiV41Fe1xW2N8=;
 b=KezBNC2vK6kSU9Vc71mUHnoQoZU8fX5sgbioDDLTQfJwfzRiLH5gnE+Q2BSAaK5Kq+JZSGIgJO5eZQfys3TNmQjGWPeaOXcc1UPGjlxzsSPGyq8BBnXvSXgpFPtnJl3E/36q3rbI1sb0jBUt5ROJYG1YYxBRAmRqLI/cMpPu+6k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGNvZGUgdXNlIGhleCBkZWZpbmUsIHNvIHNob3VsZCB0aGUgcHJpbnRpbmcuIEFsc28sIHBy
aW50ZiBhIG1lc3NhZ2UKaWYgdGhlcmUgaXMgYSBmYWlsdXJlLgoKQ2hhbmdlLUlkOiBJYTdjYzc2
OTA1NTNiYjA0MzkxNWIzZDhjMDE1NzIxNmM2NDQyMWE2MApTaWduZWQtb2ZmLWJ5OiBZb25nIFpo
YW8gPFlvbmcuWmhhb0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9jaGFyZGV2LmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9jaGFyZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jCmlu
ZGV4IGMyOGJhMGMxZDdhYy4uZDFhYjA5YzBmNTIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9jaGFyZGV2LmMKQEAgLTE4NDAsNyArMTg0MCw3IEBAIHN0YXRpYyBsb25nIGtmZF9p
b2N0bChzdHJ1Y3QgZmlsZSAqZmlsZXAsIHVuc2lnbmVkIGludCBjbWQsIHVuc2lnbmVkIGxvbmcg
YXJnKQogCX0gZWxzZQogCQlnb3RvIGVycl9pMTsKIAotCWRldl9kYmcoa2ZkX2RldmljZSwgImlv
Y3RsIGNtZCAweCV4ICgjJWQpLCBhcmcgMHglbHhcbiIsIGNtZCwgbnIsIGFyZyk7CisJZGV2X2Ri
ZyhrZmRfZGV2aWNlLCAiaW9jdGwgY21kIDB4JXggKCMweCV4KSwgYXJnIDB4JWx4XG4iLCBjbWQs
IG5yLCBhcmcpOwogCiAJcHJvY2VzcyA9IGtmZF9nZXRfcHJvY2VzcyhjdXJyZW50KTsKIAlpZiAo
SVNfRVJSKHByb2Nlc3MpKSB7CkBAIC0xODk1LDcgKzE4OTUsOCBAQCBzdGF0aWMgbG9uZyBrZmRf
aW9jdGwoc3RydWN0IGZpbGUgKmZpbGVwLCB1bnNpZ25lZCBpbnQgY21kLCB1bnNpZ25lZCBsb25n
IGFyZykKIAkJa2ZyZWUoa2RhdGEpOwogCiAJaWYgKHJldGNvZGUpCi0JCWRldl9kYmcoa2ZkX2Rl
dmljZSwgInJldCA9ICVkXG4iLCByZXRjb2RlKTsKKwkJZGV2X2VycihrZmRfZGV2aWNlLCAiaW9j
dGwgY21kICgjMHgleCksIGFyZyAweCVseCwgcmV0ID0gJWRcbiIsCisJCQkJbnIsIGFyZywgcmV0
Y29kZSk7CiAKIAlyZXR1cm4gcmV0Y29kZTsKIH0KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
