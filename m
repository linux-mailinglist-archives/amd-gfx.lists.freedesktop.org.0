Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 879AF10193
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07333892ED;
	Tue, 30 Apr 2019 21:10:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730066.outbound.protection.outlook.com [40.107.73.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F39892CD
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:10:19 +0000 (UTC)
Received: from DM3PR12CA0107.namprd12.prod.outlook.com (2603:10b6:0:55::27) by
 BY2PR12MB0647.namprd12.prod.outlook.com (2a01:111:e400:52e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.13; Tue, 30 Apr
 2019 21:10:18 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by DM3PR12CA0107.outlook.office365.com
 (2603:10b6:0:55::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:10:17 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:10:17 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:57 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 20/20] drm/amd/display: Add profiling tools for bandwidth
 validation
Date: Tue, 30 Apr 2019 17:09:37 -0400
Message-ID: <20190430210938.32335-40-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(376002)(136003)(2980300002)(428003)(199004)(189003)(48376002)(8936002)(53416004)(50466002)(72206003)(53936002)(478600001)(70586007)(476003)(1076003)(2616005)(11346002)(486006)(86362001)(47776003)(6666004)(126002)(446003)(81156014)(81166006)(8676002)(14444005)(356004)(2351001)(50226002)(68736007)(26005)(305945005)(336012)(186003)(426003)(70206006)(77096007)(4326008)(16586007)(6916009)(36756003)(76176011)(51416003)(2906002)(316002)(5660300002)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR12MB0647; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa95f5d5-5237-4121-cba1-08d6cdb03f2e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BY2PR12MB0647; 
X-MS-TrafficTypeDiagnostic: BY2PR12MB0647:
X-Microsoft-Antispam-PRVS: <BY2PR12MB0647FED7650B102B10F8D0EEF93A0@BY2PR12MB0647.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: hJ677MI2eLh6tj3Rdn/NEg4O8lYT/SYz5b43XfCnto44LaFOJntUVCE82RQCJ2PaVuMENwmbMIJBL6isQJicGpyTpMIzWvQHEp8a+TxT2rkA1RqUibwuL61eGvbEkRi9qy+7xkdIs9NXJEX6hRasDhccWaq+JnVeRF3NiiqhJI4tUtVrjhkfO8gYWAMr5VNuZ+drWFOWzmjobo7WTdfXNAqfbywEPPUU4aosJ18VOmeT6rS9tHW0u22VB84Ra+cUEVTEuXd1F+JyqYDEDfp+M/owoMR+b4sYSQAmqhbk0mL0oP8wNviwX8PKRjsYCk9dwV2foHHXiXt9eSHq4eZALhIyK4mLYfIw876VVU1swNYrNbBpT0P7gTCpGUDZvXxlSodKTQPhm8Z+Gn4czsaQOlpnvamaBuGn6fbAKNg2MwQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:10:17.5712 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa95f5d5-5237-4121-cba1-08d6cdb03f2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR12MB0647
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6f7fm9Ridqgaq0+LjRdi9YGLtXgH7y71slfIx/f/saY=;
 b=AQg80OHI53pa712v89icV0fcwt7clX9vI1erEwwJJdAZ0dsyarTdH/H8+X2RVyY8iZQgJvmdYGRl82eCW0KMO0Hyf7Tq+VIwPbF21uaG+q3+EMZWQ/mK3IKS9L6w/rzh/I2fbc0x0HXjniVt7ycCr2+TIP0Sw14LPKQVnjxlpNE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Joshua Aberback <joshua.aberback@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9zaHVhIEFiZXJiYWNrIDxqb3NodWEuYWJlcmJhY2tAYW1kLmNvbT4KCltXaHldCldl
IHVzZWQgdGhpcyBjaGFuZ2UgdG8gaW52ZXN0aWdhdGUgdGhlIHBlcmZvcm1hbmNlIG9mIGJhbmR3
aWR0aCB2YWxpZGF0aW9uLAppdCB3aWxsIGJlIHVzZWZ1bCB0byBoYXZlIGlmIHdlIG5lZWQgdG8g
aW52ZXN0aWdhdGUgZnVydGhlci4KCltIb3ddCldlIHVzZSBwZXJmb3JtYW5jZSBjb3VudGVyIHRp
Y2sgbnVtYmVycyB0byBwcm9maWxlIHBlcmZvcm1hbmNlLCB0aGV5IGxpdmUKYXQgZGMtPmRlYnVn
LmJ3X3ZhbF9wcm9maWxlIChzZXQgLmVuYWJsZSBpbiBkZWJ1Z2dlciB0byB0dXJuIG9uIG1lYXN1
cmluZykuCgpDaGFuZ2UtSWQ6IEk4MjgzMDY4ODI4MzdjNzdjOTJhNjZmNWMyYjlkMmRlMjk2Njg1
NDE2ClNpZ25lZC1vZmYtYnk6IEpvc2h1YSBBYmVyYmFjayA8am9zaHVhLmFiZXJiYWNrQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBUb255IENoZW5nIDxUb255LkNoZW5nQGFtZC5jb20+CkFja2VkLWJ5
OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQgTGFraGFAYW1kLmNvbT4KLS0tCiAuLi4v
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY25fY2FsY3MuYyAgfCAxOCArKysrKysrCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCAgICAgICAgICAgfCA1MiArKysrKysr
KysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNuX2NhbGNzLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNuX2NhbGNzLmMKaW5kZXggZDdh
ZWNlODJlNGZlLi4xYjRiNTE2NTdmNWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jYWxjcy9kY25fY2FsY3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY2FsY3MvZGNuX2NhbGNzLmMKQEAgLTcwNCw2ICs3MDQsMTIgQEAgYm9vbCBkY25f
dmFsaWRhdGVfYmFuZHdpZHRoKAogCQlzdHJ1Y3QgZGNfc3RhdGUgKmNvbnRleHQsCiAJCWJvb2wg
ZmFzdF92YWxpZGF0ZSkKIHsKKwkvKgorCSAqIHdlIHdhbnQgYSBicmVha2Rvd24gb2YgdGhlIHZh
cmlvdXMgc3RhZ2VzIG9mIHZhbGlkYXRpb24sIHdoaWNoIHRoZQorCSAqIHBlcmZfdHJhY2UgbWFj
cm8gZG9lc24ndCBzdXBwb3J0CisJICovCisJQldfVkFMX1RSQUNFX1NFVFVQKCk7CisKIAljb25z
dCBzdHJ1Y3QgcmVzb3VyY2VfcG9vbCAqcG9vbCA9IGRjLT5yZXNfcG9vbDsKIAlzdHJ1Y3QgZGNu
X2J3X2ludGVybmFsX3ZhcnMgKnYgPSAmY29udGV4dC0+ZGNuX2J3X3ZhcnM7CiAJaW50IGksIGlu
cHV0X2lkeDsKQEAgLTcxMiw2ICs3MTgsOSBAQCBib29sIGRjbl92YWxpZGF0ZV9iYW5kd2lkdGgo
CiAJZmxvYXQgYndfbGltaXQ7CiAKIAlQRVJGT1JNQU5DRV9UUkFDRV9TVEFSVCgpOworCisJQldf
VkFMX1RSQUNFX0NPVU5UKCk7CisKIAlpZiAoZGNuX2J3X2FwcGx5X3JlZ2lzdHJ5X292ZXJyaWRl
KGRjKSkKIAkJZGNuX2J3X3N5bmNfY2FsY3NfYW5kX2RtbChkYyk7CiAKQEAgLTEwMTQsNiArMTAy
Myw4IEBAIGJvb2wgZGNuX3ZhbGlkYXRlX2JhbmR3aWR0aCgKIAkJbW9kZV9zdXBwb3J0X2FuZF9z
eXN0ZW1fY29uZmlndXJhdGlvbih2KTsKIAl9CiAKKwlCV19WQUxfVFJBQ0VfRU5EX1ZPTFRBR0Vf
TEVWRUwoKTsKKwogCWlmICh2LT52b2x0YWdlX2xldmVsICE9IG51bWJlcl9vZl9zdGF0ZXNfcGx1
c19vbmUgJiYgIWZhc3RfdmFsaWRhdGUpIHsKIAkJZmxvYXQgYndfY29uc3VtZWQgPSB2LT50b3Rh
bF9iYW5kd2lkdGhfY29uc3VtZWRfZ2J5dGVfcGVyX3NlY29uZDsKIApAQCAtMTA4OSw2ICsxMTAw
LDggQEAgYm9vbCBkY25fdmFsaWRhdGVfYmFuZHdpZHRoKAogCQkJYnJlYWs7CiAJCX0KIAorCQlC
V19WQUxfVFJBQ0VfRU5EX1dBVEVSTUFSS1MoKTsKKwogCQlmb3IgKGkgPSAwLCBpbnB1dF9pZHgg
PSAwOyBpIDwgcG9vbC0+cGlwZV9jb3VudDsgaSsrKSB7CiAJCQlzdHJ1Y3QgcGlwZV9jdHggKnBp
cGUgPSAmY29udGV4dC0+cmVzX2N0eC5waXBlX2N0eFtpXTsKIApAQCAtMTE3OSw2ICsxMTkyLDEw
IEBAIGJvb2wgZGNuX3ZhbGlkYXRlX2JhbmR3aWR0aCgKIAogCQkJaW5wdXRfaWR4Kys7CiAJCX0K
Kwl9IGVsc2UgaWYgKHYtPnZvbHRhZ2VfbGV2ZWwgPT0gbnVtYmVyX29mX3N0YXRlc19wbHVzX29u
ZSkgeworCQlCV19WQUxfVFJBQ0VfU0tJUChmYWlsKTsKKwl9IGVsc2UgaWYgKGZhc3RfdmFsaWRh
dGUpIHsKKwkJQldfVkFMX1RSQUNFX1NLSVAoZmFzdCk7CiAJfQogCiAJaWYgKHYtPnZvbHRhZ2Vf
bGV2ZWwgPT0gMCkgewpAQCAtMTE5OCw2ICsxMjE1LDcgQEAgYm9vbCBkY25fdmFsaWRhdGVfYmFu
ZHdpZHRoKAogCWtlcm5lbF9mcHVfZW5kKCk7CiAKIAlQRVJGT1JNQU5DRV9UUkFDRV9FTkQoKTsK
KwlCV19WQUxfVFJBQ0VfRklOSVNIKCk7CiAKIAlpZiAoYndfbGltaXRfcGFzcyAmJiB2LT52b2x0
YWdlX2xldmVsICE9IDUpCiAJCXJldHVybiB0cnVlOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGMuaAppbmRleCA3MmJlYmQ3NTIzYjguLjU1NTc3ZTIzZjE4ZSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjLmgKQEAgLTI0OSw2ICsyNDksNTcgQEAgc3RydWN0IGRjX2Nsb2NrcyB7CiAJ
Ym9vbCBwX3N0YXRlX2NoYW5nZV9zdXBwb3J0OwogfTsKIAorc3RydWN0IGRjX2J3X3ZhbGlkYXRp
b25fcHJvZmlsZSB7CisJYm9vbCBlbmFibGU7CisKKwl1bnNpZ25lZCBsb25nIGxvbmcgdG90YWxf
dGlja3M7CisJdW5zaWduZWQgbG9uZyBsb25nIHZvbHRhZ2VfbGV2ZWxfdGlja3M7CisJdW5zaWdu
ZWQgbG9uZyBsb25nIHdhdGVybWFya190aWNrczsKKwl1bnNpZ25lZCBsb25nIGxvbmcgcnFfZGxn
X3RpY2tzOworCisJdW5zaWduZWQgbG9uZyBsb25nIHRvdGFsX2NvdW50OworCXVuc2lnbmVkIGxv
bmcgbG9uZyBza2lwX2Zhc3RfY291bnQ7CisJdW5zaWduZWQgbG9uZyBsb25nIHNraXBfcGFzc19j
b3VudDsKKwl1bnNpZ25lZCBsb25nIGxvbmcgc2tpcF9mYWlsX2NvdW50OworfTsKKworI2RlZmlu
ZSBCV19WQUxfVFJBQ0VfU0VUVVAoKSBcCisJCXVuc2lnbmVkIGxvbmcgbG9uZyBlbmRfdGljayA9
IDA7IFwKKwkJdW5zaWduZWQgbG9uZyBsb25nIHZvbHRhZ2VfbGV2ZWxfdGljayA9IDA7IFwKKwkJ
dW5zaWduZWQgbG9uZyBsb25nIHdhdGVybWFya190aWNrID0gMDsgXAorCQl1bnNpZ25lZCBsb25n
IGxvbmcgc3RhcnRfdGljayA9IGRjLT5kZWJ1Zy5id192YWxfcHJvZmlsZS5lbmFibGUgPyBcCisJ
CQkJZG1fZ2V0X3RpbWVzdGFtcChkYy0+Y3R4KSA6IDAKKworI2RlZmluZSBCV19WQUxfVFJBQ0Vf
Q09VTlQoKSBcCisJCWlmIChkYy0+ZGVidWcuYndfdmFsX3Byb2ZpbGUuZW5hYmxlKSBcCisJCQlk
Yy0+ZGVidWcuYndfdmFsX3Byb2ZpbGUudG90YWxfY291bnQrKworCisjZGVmaW5lIEJXX1ZBTF9U
UkFDRV9TS0lQKHN0YXR1cykgXAorCQlpZiAoZGMtPmRlYnVnLmJ3X3ZhbF9wcm9maWxlLmVuYWJs
ZSkgeyBcCisJCQlpZiAoIXZvbHRhZ2VfbGV2ZWxfdGljaykgXAorCQkJCXZvbHRhZ2VfbGV2ZWxf
dGljayA9IGRtX2dldF90aW1lc3RhbXAoZGMtPmN0eCk7IFwKKwkJCWRjLT5kZWJ1Zy5id192YWxf
cHJvZmlsZS5za2lwXyAjIyBzdGF0dXMgIyMgX2NvdW50Kys7IFwKKwkJfQorCisjZGVmaW5lIEJX
X1ZBTF9UUkFDRV9FTkRfVk9MVEFHRV9MRVZFTCgpIFwKKwkJaWYgKGRjLT5kZWJ1Zy5id192YWxf
cHJvZmlsZS5lbmFibGUpIFwKKwkJCXZvbHRhZ2VfbGV2ZWxfdGljayA9IGRtX2dldF90aW1lc3Rh
bXAoZGMtPmN0eCkKKworI2RlZmluZSBCV19WQUxfVFJBQ0VfRU5EX1dBVEVSTUFSS1MoKSBcCisJ
CWlmIChkYy0+ZGVidWcuYndfdmFsX3Byb2ZpbGUuZW5hYmxlKSBcCisJCQl3YXRlcm1hcmtfdGlj
ayA9IGRtX2dldF90aW1lc3RhbXAoZGMtPmN0eCkKKworI2RlZmluZSBCV19WQUxfVFJBQ0VfRklO
SVNIKCkgXAorCQlpZiAoZGMtPmRlYnVnLmJ3X3ZhbF9wcm9maWxlLmVuYWJsZSkgeyBcCisJCQll
bmRfdGljayA9IGRtX2dldF90aW1lc3RhbXAoZGMtPmN0eCk7IFwKKwkJCWRjLT5kZWJ1Zy5id192
YWxfcHJvZmlsZS50b3RhbF90aWNrcyArPSBlbmRfdGljayAtIHN0YXJ0X3RpY2s7IFwKKwkJCWRj
LT5kZWJ1Zy5id192YWxfcHJvZmlsZS52b2x0YWdlX2xldmVsX3RpY2tzICs9IHZvbHRhZ2VfbGV2
ZWxfdGljayAtIHN0YXJ0X3RpY2s7IFwKKwkJCWlmICh3YXRlcm1hcmtfdGljaykgeyBcCisJCQkJ
ZGMtPmRlYnVnLmJ3X3ZhbF9wcm9maWxlLndhdGVybWFya190aWNrcyArPSB3YXRlcm1hcmtfdGlj
ayAtIHZvbHRhZ2VfbGV2ZWxfdGljazsgXAorCQkJCWRjLT5kZWJ1Zy5id192YWxfcHJvZmlsZS5y
cV9kbGdfdGlja3MgKz0gZW5kX3RpY2sgLSB3YXRlcm1hcmtfdGljazsgXAorCQkJfSBcCisJCX0K
Kwogc3RydWN0IGRjX2RlYnVnX29wdGlvbnMgewogCWVudW0gdmlzdWFsX2NvbmZpcm0gdmlzdWFs
X2NvbmZpcm07CiAJYm9vbCBzYW5pdHlfY2hlY2tzOwpAQCAtMzAyLDYgKzM1Myw3IEBAIHN0cnVj
dCBkY19kZWJ1Z19vcHRpb25zIHsKIAl1bnNpZ25lZCBpbnQgZm9yY2Vfb2RtX2NvbWJpbmU7IC8v
Yml0IHZlY3RvciBiYXNlZCBvbiBvdGcgaW5zdAogCXVuc2lnbmVkIGludCBmb3JjZV9mY2xrX2to
ejsKIAlib29sIGRpc2FibGVfdHJpX2J1ZjsKKwlzdHJ1Y3QgZGNfYndfdmFsaWRhdGlvbl9wcm9m
aWxlIGJ3X3ZhbF9wcm9maWxlOwogfTsKIAogc3RydWN0IGRjX2RlYnVnX2RhdGEgewotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
