Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CDF10174
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CF48922B;
	Tue, 30 Apr 2019 21:09:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690058.outbound.protection.outlook.com [40.107.69.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D493789221
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:09:50 +0000 (UTC)
Received: from SN1PR12CA0068.namprd12.prod.outlook.com (2603:10b6:802:20::39)
 by MN2PR12MB3757.namprd12.prod.outlook.com (2603:10b6:208:163::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.10; Tue, 30 Apr
 2019 21:09:49 +0000
Received: from BY2NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by SN1PR12CA0068.outlook.office365.com
 (2603:10b6:802:20::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:09:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT031.mail.protection.outlook.com (10.152.84.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:09:48 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:44 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/20] drm/amd/display: Refactor program watermark.
Date: Tue, 30 Apr 2019 17:09:02 -0400
Message-ID: <20190430210938.32335-5-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(50226002)(68736007)(81166006)(81156014)(8936002)(53936002)(4326008)(305945005)(6916009)(8676002)(7696005)(70586007)(36756003)(51416003)(53416004)(70206006)(1076003)(30864003)(2906002)(14444005)(50466002)(2351001)(76176011)(5660300002)(356004)(6666004)(426003)(486006)(336012)(446003)(11346002)(126002)(86362001)(2616005)(77096007)(47776003)(186003)(72206003)(316002)(48376002)(478600001)(16586007)(26005)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3757; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76dbbd45-3a89-46d9-c1a8-08d6cdb02dc7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:MN2PR12MB3757; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3757:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3757ABD7A462F334885742FFF93A0@MN2PR12MB3757.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: vHScKY7JbO1J5oiNgYZJ62pYDrLy5cJef6LXgbsCs5YB0KMXlvwQsv+FclH96hX0Qbd+RvI86FUNamm4U+owg/xdQf/RhhgQ6alPiXbgFy/dWOR+1CBUHjC8kvCiarZhzBwoxH6cE7WEWb/xvXrT56WykFqy0QtA/mPlIQ3oAa91mWMs8yE/Z7Z1G8zvmethLLVMBzHH2eBlWKgBWYoLqPxZ6L8oFYRlPbMEBIwWkhrwbsIqs+6/1MI5ywCxwD1qY3/coV5tRKYrF6/dVQQBP+hCXsHyyCsoLhn7LoD5p7ReQvv53BMWz+BjabsR1Da/ammmKfIsrZQrz3K5t3CGiMiL3N+MXGcY7XPcg0I06k/94p0oquyn9RYd3WScvUIOkYS01sc52ppPrMUYQNEp76OArXqmhp9LIwaQaOlju40=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:09:48.3506 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76dbbd45-3a89-46d9-c1a8-08d6cdb02dc7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3757
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugbNCUXHULIFKj8llgmQqd1Iz/bVJb5aeMoRoUKXbqc=;
 b=TtVroRxE7Nkc+C2jy2qd+ZlySrgRvwbqZosR/T8Nr9FU9Zq68N57KanC4SLuzDcLfXWiMIvX0Wq9kQfvMj1dsvHFYgKWruhOa5qe9kgpDrvaiyGE0+u1i3cbbiR1qrNA2hz1H7+bBitDBdpcnCuqCvVzQwQtggwoG4mFBMv25lo=
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
Cc: Yongqiang Sun <yongqiang.sun@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIFN1biA8eW9uZ3FpYW5nLnN1bkBhbWQuY29tPgoKUmVmYWN0b3IgcHJv
Z3JhbW1pbmcgd2F0ZXJtYXJrIGZ1bmN0aW9uOgpEaXZpZGVkIGludG8gdXJnZW50IHdhdGVybWFy
aywgc3R1dHRlciB3YXRlcm1hcmsgYW5kIHBzdGF0ZSB3YXRlcm1hcmsuCgpDaGFuZ2UtSWQ6IEk5
NWNhMTg5NzY3MjM3YWVkZjkxZTQ1NGYxZjcyMTVjZGNjOGMxODIxClNpZ25lZC1vZmYtYnk6IFlv
bmdxaWFuZyBTdW4gPHlvbmdxaWFuZy5zdW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFRvbnkgQ2hl
bmcgPFRvbnkuQ2hlbmdAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3
YW5wcmVldCBMYWtoYUBhbWQuY29tPgotLS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAv
ZGNuMTBfaHViYnViLmMgICB8IDQyOCArKysrKysrKystLS0tLS0tLS0KIC4uLi9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMTAvZGNuMTBfaHViYnViLmggICB8ICAxNiArCiAyIGZpbGVzIGNoYW5nZWQs
IDI0MiBpbnNlcnRpb25zKCspLCAyMDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h1YmJ1Yi5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h1YmJ1Yi5jCmluZGV4IDBkYjJhNmU5
NmZjMC4uMTc3MjQ3NTk1OTc0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMTAvZGNuMTBfaHViYnViLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjEwL2RjbjEwX2h1YmJ1Yi5jCkBAIC0yNjMsMjAgKzI2MywxNSBAQCB2b2lkIGh1
YmJ1YjFfd21fY2hhbmdlX3JlcV93YShzdHJ1Y3QgaHViYnViICpodWJidWIpCiAJCQlEQ0hVQkJV
Ql9BUkJfV0FURVJNQVJLX0NIQU5HRV9SRVFVRVNULCAxKTsKIH0KIAotdm9pZCBodWJidWIxX3By
b2dyYW1fd2F0ZXJtYXJrcygKK3ZvaWQgaHViYnViMV9wcm9ncmFtX3VyZ2VudF93YXRlcm1hcmtz
KAogCQlzdHJ1Y3QgaHViYnViICpodWJidWIsCiAJCXN0cnVjdCBkY25fd2F0ZXJtYXJrX3NldCAq
d2F0ZXJtYXJrcywKIAkJdW5zaWduZWQgaW50IHJlZmNsa19taHosCiAJCWJvb2wgc2FmZV90b19s
b3dlcikKIHsKIAlzdHJ1Y3QgZGNuMTBfaHViYnViICpodWJidWIxID0gVE9fRENOMTBfSFVCQlVC
KGh1YmJ1Yik7Ci0JLyoKLQkgKiBOZWVkIHRvIGNsYW1wIHRvIG1heCBvZiB0aGUgcmVnaXN0ZXIg
dmFsdWVzIChpLmUuIG5vIHdyYXApCi0JICogZm9yIGRjbjEsIGFsbCB3bSByZWdpc3RlcnMgYXJl
IDIxLWJpdCB3aWRlCi0JICovCiAJdWludDMyX3QgcHJvZ193bV92YWx1ZTsKIAotCiAJLyogUmVw
ZWF0IGZvciB3YXRlciBtYXJrIHNldCBBLCBCLCBDIGFuZCBELiAqLwogCS8qIGNsb2NrIHN0YXRl
IEEgKi8KIAlpZiAoc2FmZV90b19sb3dlciB8fCB3YXRlcm1hcmtzLT5hLnVyZ2VudF9ucyA+IGh1
YmJ1YjEtPndhdGVybWFya3MuYS51cmdlbnRfbnMpIHsKQEAgLTI5MSw2MCArMjg2LDE0IEBAIHZv
aWQgaHViYnViMV9wcm9ncmFtX3dhdGVybWFya3MoCiAJCQl3YXRlcm1hcmtzLT5hLnVyZ2VudF9u
cywgcHJvZ193bV92YWx1ZSk7CiAJfQogCi0JaWYgKFJFRyhEQ0hVQkJVQl9BUkJfUFRFX01FVEFf
VVJHRU5DWV9XQVRFUk1BUktfQSkpIHsKLQkJaWYgKHNhZmVfdG9fbG93ZXIgfHwgd2F0ZXJtYXJr
cy0+YS5wdGVfbWV0YV91cmdlbnRfbnMgPiBodWJidWIxLT53YXRlcm1hcmtzLmEucHRlX21ldGFf
dXJnZW50X25zKSB7Ci0JCQlodWJidWIxLT53YXRlcm1hcmtzLmEucHRlX21ldGFfdXJnZW50X25z
ID0gd2F0ZXJtYXJrcy0+YS5wdGVfbWV0YV91cmdlbnRfbnM7Ci0JCQlwcm9nX3dtX3ZhbHVlID0g
Y29udmVydF9hbmRfY2xhbXAod2F0ZXJtYXJrcy0+YS5wdGVfbWV0YV91cmdlbnRfbnMsCi0JCQkJ
CXJlZmNsa19taHosIDB4MWZmZmZmKTsKLQkJCVJFR19XUklURShEQ0hVQkJVQl9BUkJfUFRFX01F
VEFfVVJHRU5DWV9XQVRFUk1BUktfQSwgcHJvZ193bV92YWx1ZSk7Ci0JCQlEQ19MT0dfQkFORFdJ
RFRIX0NBTENTKCJQVEVfTUVUQV9VUkdFTkNZX1dBVEVSTUFSS19BIGNhbGN1bGF0ZWQgPSVkXG4i
Ci0JCQkJIkhXIHJlZ2lzdGVyIHZhbHVlID0gMHgleFxuIiwKLQkJCQl3YXRlcm1hcmtzLT5hLnB0
ZV9tZXRhX3VyZ2VudF9ucywgcHJvZ193bV92YWx1ZSk7Ci0JCX0KLQl9Ci0KLQlpZiAoUkVHKERD
SFVCQlVCX0FSQl9BTExPV19TUl9FTlRFUl9XQVRFUk1BUktfQSkpIHsKLQkJaWYgKHNhZmVfdG9f
bG93ZXIgfHwgd2F0ZXJtYXJrcy0+YS5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9lbnRlcl9wbHVzX2V4
aXRfbnMKLQkJCQk+IGh1YmJ1YjEtPndhdGVybWFya3MuYS5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9l
bnRlcl9wbHVzX2V4aXRfbnMpIHsKLQkJCWh1YmJ1YjEtPndhdGVybWFya3MuYS5jc3RhdGVfcHN0
YXRlLmNzdGF0ZV9lbnRlcl9wbHVzX2V4aXRfbnMgPQotCQkJCQl3YXRlcm1hcmtzLT5hLmNzdGF0
ZV9wc3RhdGUuY3N0YXRlX2VudGVyX3BsdXNfZXhpdF9uczsKLQkJCXByb2dfd21fdmFsdWUgPSBj
b252ZXJ0X2FuZF9jbGFtcCgKLQkJCQkJd2F0ZXJtYXJrcy0+YS5jc3RhdGVfcHN0YXRlLmNzdGF0
ZV9lbnRlcl9wbHVzX2V4aXRfbnMsCi0JCQkJCXJlZmNsa19taHosIDB4MWZmZmZmKTsKLQkJCVJF
R19TRVQoRENIVUJCVUJfQVJCX0FMTE9XX1NSX0VOVEVSX1dBVEVSTUFSS19BLCAwLAotCQkJCQlE
Q0hVQkJVQl9BUkJfQUxMT1dfU1JfRU5URVJfV0FURVJNQVJLX0EsIHByb2dfd21fdmFsdWUpOwot
CQkJRENfTE9HX0JBTkRXSURUSF9DQUxDUygiU1JfRU5URVJfRVhJVF9XQVRFUk1BUktfQSBjYWxj
dWxhdGVkID0lZFxuIgotCQkJCSJIVyByZWdpc3RlciB2YWx1ZSA9IDB4JXhcbiIsCi0JCQkJd2F0
ZXJtYXJrcy0+YS5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9lbnRlcl9wbHVzX2V4aXRfbnMsIHByb2df
d21fdmFsdWUpOwotCQl9Ci0KLQkJaWYgKHNhZmVfdG9fbG93ZXIgfHwgd2F0ZXJtYXJrcy0+YS5j
c3RhdGVfcHN0YXRlLmNzdGF0ZV9leGl0X25zCi0JCQkJPiBodWJidWIxLT53YXRlcm1hcmtzLmEu
Y3N0YXRlX3BzdGF0ZS5jc3RhdGVfZXhpdF9ucykgewotCQkJaHViYnViMS0+d2F0ZXJtYXJrcy5h
LmNzdGF0ZV9wc3RhdGUuY3N0YXRlX2V4aXRfbnMgPQotCQkJCQl3YXRlcm1hcmtzLT5hLmNzdGF0
ZV9wc3RhdGUuY3N0YXRlX2V4aXRfbnM7Ci0JCQlwcm9nX3dtX3ZhbHVlID0gY29udmVydF9hbmRf
Y2xhbXAoCi0JCQkJCXdhdGVybWFya3MtPmEuY3N0YXRlX3BzdGF0ZS5jc3RhdGVfZXhpdF9ucywK
LQkJCQkJcmVmY2xrX21oeiwgMHgxZmZmZmYpOwotCQkJUkVHX1NFVChEQ0hVQkJVQl9BUkJfQUxM
T1dfU1JfRVhJVF9XQVRFUk1BUktfQSwgMCwKLQkJCQkJRENIVUJCVUJfQVJCX0FMTE9XX1NSX0VY
SVRfV0FURVJNQVJLX0EsIHByb2dfd21fdmFsdWUpOwotCQkJRENfTE9HX0JBTkRXSURUSF9DQUxD
UygiU1JfRVhJVF9XQVRFUk1BUktfQSBjYWxjdWxhdGVkID0lZFxuIgotCQkJCSJIVyByZWdpc3Rl
ciB2YWx1ZSA9IDB4JXhcbiIsCi0JCQkJd2F0ZXJtYXJrcy0+YS5jc3RhdGVfcHN0YXRlLmNzdGF0
ZV9leGl0X25zLCBwcm9nX3dtX3ZhbHVlKTsKLQkJfQotCX0KLQotCWlmIChzYWZlX3RvX2xvd2Vy
IHx8IHdhdGVybWFya3MtPmEuY3N0YXRlX3BzdGF0ZS5wc3RhdGVfY2hhbmdlX25zCi0JCQk+IGh1
YmJ1YjEtPndhdGVybWFya3MuYS5jc3RhdGVfcHN0YXRlLnBzdGF0ZV9jaGFuZ2VfbnMpIHsKLQkJ
aHViYnViMS0+d2F0ZXJtYXJrcy5hLmNzdGF0ZV9wc3RhdGUucHN0YXRlX2NoYW5nZV9ucyA9Ci0J
CQkJd2F0ZXJtYXJrcy0+YS5jc3RhdGVfcHN0YXRlLnBzdGF0ZV9jaGFuZ2VfbnM7Ci0JCXByb2df
d21fdmFsdWUgPSBjb252ZXJ0X2FuZF9jbGFtcCgKLQkJCQl3YXRlcm1hcmtzLT5hLmNzdGF0ZV9w
c3RhdGUucHN0YXRlX2NoYW5nZV9ucywKKwlpZiAoc2FmZV90b19sb3dlciB8fCB3YXRlcm1hcmtz
LT5hLnB0ZV9tZXRhX3VyZ2VudF9ucyA+IGh1YmJ1YjEtPndhdGVybWFya3MuYS5wdGVfbWV0YV91
cmdlbnRfbnMpIHsKKwkJaHViYnViMS0+d2F0ZXJtYXJrcy5hLnB0ZV9tZXRhX3VyZ2VudF9ucyA9
IHdhdGVybWFya3MtPmEucHRlX21ldGFfdXJnZW50X25zOworCQlwcm9nX3dtX3ZhbHVlID0gY29u
dmVydF9hbmRfY2xhbXAod2F0ZXJtYXJrcy0+YS5wdGVfbWV0YV91cmdlbnRfbnMsCiAJCQkJcmVm
Y2xrX21oeiwgMHgxZmZmZmYpOwotCQlSRUdfU0VUKERDSFVCQlVCX0FSQl9BTExPV19EUkFNX0NM
S19DSEFOR0VfV0FURVJNQVJLX0EsIDAsCi0JCQkJRENIVUJCVUJfQVJCX0FMTE9XX0RSQU1fQ0xL
X0NIQU5HRV9XQVRFUk1BUktfQSwgcHJvZ193bV92YWx1ZSk7Ci0JCURDX0xPR19CQU5EV0lEVEhf
Q0FMQ1MoIkRSQU1fQ0xLX0NIQU5HRV9XQVRFUk1BUktfQSBjYWxjdWxhdGVkID0lZFxuIgotCQkJ
IkhXIHJlZ2lzdGVyIHZhbHVlID0gMHgleFxuXG4iLAotCQkJd2F0ZXJtYXJrcy0+YS5jc3RhdGVf
cHN0YXRlLnBzdGF0ZV9jaGFuZ2VfbnMsIHByb2dfd21fdmFsdWUpOworCQlSRUdfV1JJVEUoRENI
VUJCVUJfQVJCX1BURV9NRVRBX1VSR0VOQ1lfV0FURVJNQVJLX0EsIHByb2dfd21fdmFsdWUpOwor
CQlEQ19MT0dfQkFORFdJRFRIX0NBTENTKCJQVEVfTUVUQV9VUkdFTkNZX1dBVEVSTUFSS19BIGNh
bGN1bGF0ZWQgPSVkXG4iCisJCQkiSFcgcmVnaXN0ZXIgdmFsdWUgPSAweCV4XG4iLAorCQkJd2F0
ZXJtYXJrcy0+YS5wdGVfbWV0YV91cmdlbnRfbnMsIHByb2dfd21fdmFsdWUpOwogCX0KIAogCS8q
IGNsb2NrIHN0YXRlIEIgKi8KQEAgLTM2MCw2MCArMzA5LDE0IEBAIHZvaWQgaHViYnViMV9wcm9n
cmFtX3dhdGVybWFya3MoCiAJCQl3YXRlcm1hcmtzLT5iLnVyZ2VudF9ucywgcHJvZ193bV92YWx1
ZSk7CiAJfQogCi0JaWYgKFJFRyhEQ0hVQkJVQl9BUkJfUFRFX01FVEFfVVJHRU5DWV9XQVRFUk1B
UktfQikpIHsKLQkJaWYgKHNhZmVfdG9fbG93ZXIgfHwgd2F0ZXJtYXJrcy0+Yi5wdGVfbWV0YV91
cmdlbnRfbnMgPiBodWJidWIxLT53YXRlcm1hcmtzLmIucHRlX21ldGFfdXJnZW50X25zKSB7Ci0J
CQlodWJidWIxLT53YXRlcm1hcmtzLmIucHRlX21ldGFfdXJnZW50X25zID0gd2F0ZXJtYXJrcy0+
Yi5wdGVfbWV0YV91cmdlbnRfbnM7Ci0JCQlwcm9nX3dtX3ZhbHVlID0gY29udmVydF9hbmRfY2xh
bXAod2F0ZXJtYXJrcy0+Yi5wdGVfbWV0YV91cmdlbnRfbnMsCi0JCQkJCXJlZmNsa19taHosIDB4
MWZmZmZmKTsKLQkJCVJFR19XUklURShEQ0hVQkJVQl9BUkJfUFRFX01FVEFfVVJHRU5DWV9XQVRF
Uk1BUktfQiwgcHJvZ193bV92YWx1ZSk7Ci0JCQlEQ19MT0dfQkFORFdJRFRIX0NBTENTKCJQVEVf
TUVUQV9VUkdFTkNZX1dBVEVSTUFSS19CIGNhbGN1bGF0ZWQgPSVkXG4iCi0JCQkJIkhXIHJlZ2lz
dGVyIHZhbHVlID0gMHgleFxuIiwKLQkJCQl3YXRlcm1hcmtzLT5iLnB0ZV9tZXRhX3VyZ2VudF9u
cywgcHJvZ193bV92YWx1ZSk7Ci0JCX0KLQl9Ci0KLQlpZiAoUkVHKERDSFVCQlVCX0FSQl9BTExP
V19TUl9FTlRFUl9XQVRFUk1BUktfQikpIHsKLQkJaWYgKHNhZmVfdG9fbG93ZXIgfHwgd2F0ZXJt
YXJrcy0+Yi5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9lbnRlcl9wbHVzX2V4aXRfbnMKLQkJCQk+IGh1
YmJ1YjEtPndhdGVybWFya3MuYi5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9lbnRlcl9wbHVzX2V4aXRf
bnMpIHsKLQkJCWh1YmJ1YjEtPndhdGVybWFya3MuYi5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9lbnRl
cl9wbHVzX2V4aXRfbnMgPQotCQkJCQl3YXRlcm1hcmtzLT5iLmNzdGF0ZV9wc3RhdGUuY3N0YXRl
X2VudGVyX3BsdXNfZXhpdF9uczsKLQkJCXByb2dfd21fdmFsdWUgPSBjb252ZXJ0X2FuZF9jbGFt
cCgKLQkJCQkJd2F0ZXJtYXJrcy0+Yi5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9lbnRlcl9wbHVzX2V4
aXRfbnMsCi0JCQkJCXJlZmNsa19taHosIDB4MWZmZmZmKTsKLQkJCVJFR19TRVQoRENIVUJCVUJf
QVJCX0FMTE9XX1NSX0VOVEVSX1dBVEVSTUFSS19CLCAwLAotCQkJCQlEQ0hVQkJVQl9BUkJfQUxM
T1dfU1JfRU5URVJfV0FURVJNQVJLX0IsIHByb2dfd21fdmFsdWUpOwotCQkJRENfTE9HX0JBTkRX
SURUSF9DQUxDUygiU1JfRU5URVJfRVhJVF9XQVRFUk1BUktfQiBjYWxjdWxhdGVkID0lZFxuIgot
CQkJCSJIVyByZWdpc3RlciB2YWx1ZSA9IDB4JXhcbiIsCi0JCQkJd2F0ZXJtYXJrcy0+Yi5jc3Rh
dGVfcHN0YXRlLmNzdGF0ZV9lbnRlcl9wbHVzX2V4aXRfbnMsIHByb2dfd21fdmFsdWUpOwotCQl9
Ci0KLQkJaWYgKHNhZmVfdG9fbG93ZXIgfHwgd2F0ZXJtYXJrcy0+Yi5jc3RhdGVfcHN0YXRlLmNz
dGF0ZV9leGl0X25zCi0JCQkJPiBodWJidWIxLT53YXRlcm1hcmtzLmIuY3N0YXRlX3BzdGF0ZS5j
c3RhdGVfZXhpdF9ucykgewotCQkJaHViYnViMS0+d2F0ZXJtYXJrcy5iLmNzdGF0ZV9wc3RhdGUu
Y3N0YXRlX2V4aXRfbnMgPQotCQkJCQl3YXRlcm1hcmtzLT5iLmNzdGF0ZV9wc3RhdGUuY3N0YXRl
X2V4aXRfbnM7Ci0JCQlwcm9nX3dtX3ZhbHVlID0gY29udmVydF9hbmRfY2xhbXAoCi0JCQkJCXdh
dGVybWFya3MtPmIuY3N0YXRlX3BzdGF0ZS5jc3RhdGVfZXhpdF9ucywKLQkJCQkJcmVmY2xrX21o
eiwgMHgxZmZmZmYpOwotCQkJUkVHX1NFVChEQ0hVQkJVQl9BUkJfQUxMT1dfU1JfRVhJVF9XQVRF
Uk1BUktfQiwgMCwKLQkJCQkJRENIVUJCVUJfQVJCX0FMTE9XX1NSX0VYSVRfV0FURVJNQVJLX0Is
IHByb2dfd21fdmFsdWUpOwotCQkJRENfTE9HX0JBTkRXSURUSF9DQUxDUygiU1JfRVhJVF9XQVRF
Uk1BUktfQiBjYWxjdWxhdGVkID0lZFxuIgotCQkJCSJIVyByZWdpc3RlciB2YWx1ZSA9IDB4JXhc
biIsCi0JCQkJd2F0ZXJtYXJrcy0+Yi5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9leGl0X25zLCBwcm9n
X3dtX3ZhbHVlKTsKLQkJfQotCX0KLQotCWlmIChzYWZlX3RvX2xvd2VyIHx8IHdhdGVybWFya3Mt
PmIuY3N0YXRlX3BzdGF0ZS5wc3RhdGVfY2hhbmdlX25zCi0JCQk+IGh1YmJ1YjEtPndhdGVybWFy
a3MuYi5jc3RhdGVfcHN0YXRlLnBzdGF0ZV9jaGFuZ2VfbnMpIHsKLQkJaHViYnViMS0+d2F0ZXJt
YXJrcy5iLmNzdGF0ZV9wc3RhdGUucHN0YXRlX2NoYW5nZV9ucyA9Ci0JCQkJd2F0ZXJtYXJrcy0+
Yi5jc3RhdGVfcHN0YXRlLnBzdGF0ZV9jaGFuZ2VfbnM7Ci0JCXByb2dfd21fdmFsdWUgPSBjb252
ZXJ0X2FuZF9jbGFtcCgKLQkJCQl3YXRlcm1hcmtzLT5iLmNzdGF0ZV9wc3RhdGUucHN0YXRlX2No
YW5nZV9ucywKKwlpZiAoc2FmZV90b19sb3dlciB8fCB3YXRlcm1hcmtzLT5iLnB0ZV9tZXRhX3Vy
Z2VudF9ucyA+IGh1YmJ1YjEtPndhdGVybWFya3MuYi5wdGVfbWV0YV91cmdlbnRfbnMpIHsKKwkJ
aHViYnViMS0+d2F0ZXJtYXJrcy5iLnB0ZV9tZXRhX3VyZ2VudF9ucyA9IHdhdGVybWFya3MtPmIu
cHRlX21ldGFfdXJnZW50X25zOworCQlwcm9nX3dtX3ZhbHVlID0gY29udmVydF9hbmRfY2xhbXAo
d2F0ZXJtYXJrcy0+Yi5wdGVfbWV0YV91cmdlbnRfbnMsCiAJCQkJcmVmY2xrX21oeiwgMHgxZmZm
ZmYpOwotCQlSRUdfU0VUKERDSFVCQlVCX0FSQl9BTExPV19EUkFNX0NMS19DSEFOR0VfV0FURVJN
QVJLX0IsIDAsCi0JCQkJRENIVUJCVUJfQVJCX0FMTE9XX0RSQU1fQ0xLX0NIQU5HRV9XQVRFUk1B
UktfQiwgcHJvZ193bV92YWx1ZSk7Ci0JCURDX0xPR19CQU5EV0lEVEhfQ0FMQ1MoIkRSQU1fQ0xL
X0NIQU5HRV9XQVRFUk1BUktfQiBjYWxjdWxhdGVkID0lZFxuIgotCQkJIkhXIHJlZ2lzdGVyIHZh
bHVlID0gMHgleFxuXG4iLAotCQkJd2F0ZXJtYXJrcy0+Yi5jc3RhdGVfcHN0YXRlLnBzdGF0ZV9j
aGFuZ2VfbnMsIHByb2dfd21fdmFsdWUpOworCQlSRUdfV1JJVEUoRENIVUJCVUJfQVJCX1BURV9N
RVRBX1VSR0VOQ1lfV0FURVJNQVJLX0IsIHByb2dfd21fdmFsdWUpOworCQlEQ19MT0dfQkFORFdJ
RFRIX0NBTENTKCJQVEVfTUVUQV9VUkdFTkNZX1dBVEVSTUFSS19CIGNhbGN1bGF0ZWQgPSVkXG4i
CisJCQkiSFcgcmVnaXN0ZXIgdmFsdWUgPSAweCV4XG4iLAorCQkJd2F0ZXJtYXJrcy0+Yi5wdGVf
bWV0YV91cmdlbnRfbnMsIHByb2dfd21fdmFsdWUpOwogCX0KIAogCS8qIGNsb2NrIHN0YXRlIEMg
Ki8KQEAgLTQyOSw2MCArMzMyLDE0IEBAIHZvaWQgaHViYnViMV9wcm9ncmFtX3dhdGVybWFya3Mo
CiAJCQl3YXRlcm1hcmtzLT5jLnVyZ2VudF9ucywgcHJvZ193bV92YWx1ZSk7CiAJfQogCi0JaWYg
KFJFRyhEQ0hVQkJVQl9BUkJfUFRFX01FVEFfVVJHRU5DWV9XQVRFUk1BUktfQykpIHsKLQkJaWYg
KHNhZmVfdG9fbG93ZXIgfHwgd2F0ZXJtYXJrcy0+Yy5wdGVfbWV0YV91cmdlbnRfbnMgPiBodWJi
dWIxLT53YXRlcm1hcmtzLmMucHRlX21ldGFfdXJnZW50X25zKSB7Ci0JCQlodWJidWIxLT53YXRl
cm1hcmtzLmMucHRlX21ldGFfdXJnZW50X25zID0gd2F0ZXJtYXJrcy0+Yy5wdGVfbWV0YV91cmdl
bnRfbnM7Ci0JCQlwcm9nX3dtX3ZhbHVlID0gY29udmVydF9hbmRfY2xhbXAod2F0ZXJtYXJrcy0+
Yy5wdGVfbWV0YV91cmdlbnRfbnMsCi0JCQkJCXJlZmNsa19taHosIDB4MWZmZmZmKTsKLQkJCVJF
R19XUklURShEQ0hVQkJVQl9BUkJfUFRFX01FVEFfVVJHRU5DWV9XQVRFUk1BUktfQywgcHJvZ193
bV92YWx1ZSk7Ci0JCQlEQ19MT0dfQkFORFdJRFRIX0NBTENTKCJQVEVfTUVUQV9VUkdFTkNZX1dB
VEVSTUFSS19DIGNhbGN1bGF0ZWQgPSVkXG4iCi0JCQkJIkhXIHJlZ2lzdGVyIHZhbHVlID0gMHgl
eFxuIiwKLQkJCQl3YXRlcm1hcmtzLT5jLnB0ZV9tZXRhX3VyZ2VudF9ucywgcHJvZ193bV92YWx1
ZSk7Ci0JCX0KLQl9Ci0KLQlpZiAoUkVHKERDSFVCQlVCX0FSQl9BTExPV19TUl9FTlRFUl9XQVRF
Uk1BUktfQykpIHsKLQkJaWYgKHNhZmVfdG9fbG93ZXIgfHwgd2F0ZXJtYXJrcy0+Yy5jc3RhdGVf
cHN0YXRlLmNzdGF0ZV9lbnRlcl9wbHVzX2V4aXRfbnMKLQkJCQk+IGh1YmJ1YjEtPndhdGVybWFy
a3MuYy5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9lbnRlcl9wbHVzX2V4aXRfbnMpIHsKLQkJCWh1YmJ1
YjEtPndhdGVybWFya3MuYy5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9lbnRlcl9wbHVzX2V4aXRfbnMg
PQotCQkJCQl3YXRlcm1hcmtzLT5jLmNzdGF0ZV9wc3RhdGUuY3N0YXRlX2VudGVyX3BsdXNfZXhp
dF9uczsKLQkJCXByb2dfd21fdmFsdWUgPSBjb252ZXJ0X2FuZF9jbGFtcCgKLQkJCQkJd2F0ZXJt
YXJrcy0+Yy5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9lbnRlcl9wbHVzX2V4aXRfbnMsCi0JCQkJCXJl
ZmNsa19taHosIDB4MWZmZmZmKTsKLQkJCVJFR19TRVQoRENIVUJCVUJfQVJCX0FMTE9XX1NSX0VO
VEVSX1dBVEVSTUFSS19DLCAwLAotCQkJCQlEQ0hVQkJVQl9BUkJfQUxMT1dfU1JfRU5URVJfV0FU
RVJNQVJLX0MsIHByb2dfd21fdmFsdWUpOwotCQkJRENfTE9HX0JBTkRXSURUSF9DQUxDUygiU1Jf
RU5URVJfRVhJVF9XQVRFUk1BUktfQyBjYWxjdWxhdGVkID0lZFxuIgotCQkJCSJIVyByZWdpc3Rl
ciB2YWx1ZSA9IDB4JXhcbiIsCi0JCQkJd2F0ZXJtYXJrcy0+Yy5jc3RhdGVfcHN0YXRlLmNzdGF0
ZV9lbnRlcl9wbHVzX2V4aXRfbnMsIHByb2dfd21fdmFsdWUpOwotCQl9Ci0KLQkJaWYgKHNhZmVf
dG9fbG93ZXIgfHwgd2F0ZXJtYXJrcy0+Yy5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9leGl0X25zCi0J
CQkJPiBodWJidWIxLT53YXRlcm1hcmtzLmMuY3N0YXRlX3BzdGF0ZS5jc3RhdGVfZXhpdF9ucykg
ewotCQkJaHViYnViMS0+d2F0ZXJtYXJrcy5jLmNzdGF0ZV9wc3RhdGUuY3N0YXRlX2V4aXRfbnMg
PQotCQkJCQl3YXRlcm1hcmtzLT5jLmNzdGF0ZV9wc3RhdGUuY3N0YXRlX2V4aXRfbnM7Ci0JCQlw
cm9nX3dtX3ZhbHVlID0gY29udmVydF9hbmRfY2xhbXAoCi0JCQkJCXdhdGVybWFya3MtPmMuY3N0
YXRlX3BzdGF0ZS5jc3RhdGVfZXhpdF9ucywKLQkJCQkJcmVmY2xrX21oeiwgMHgxZmZmZmYpOwot
CQkJUkVHX1NFVChEQ0hVQkJVQl9BUkJfQUxMT1dfU1JfRVhJVF9XQVRFUk1BUktfQywgMCwKLQkJ
CQkJRENIVUJCVUJfQVJCX0FMTE9XX1NSX0VYSVRfV0FURVJNQVJLX0MsIHByb2dfd21fdmFsdWUp
OwotCQkJRENfTE9HX0JBTkRXSURUSF9DQUxDUygiU1JfRVhJVF9XQVRFUk1BUktfQyBjYWxjdWxh
dGVkID0lZFxuIgotCQkJCSJIVyByZWdpc3RlciB2YWx1ZSA9IDB4JXhcbiIsCi0JCQkJd2F0ZXJt
YXJrcy0+Yy5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9leGl0X25zLCBwcm9nX3dtX3ZhbHVlKTsKLQkJ
fQotCX0KLQotCWlmIChzYWZlX3RvX2xvd2VyIHx8IHdhdGVybWFya3MtPmMuY3N0YXRlX3BzdGF0
ZS5wc3RhdGVfY2hhbmdlX25zCi0JCQk+IGh1YmJ1YjEtPndhdGVybWFya3MuYy5jc3RhdGVfcHN0
YXRlLnBzdGF0ZV9jaGFuZ2VfbnMpIHsKLQkJaHViYnViMS0+d2F0ZXJtYXJrcy5jLmNzdGF0ZV9w
c3RhdGUucHN0YXRlX2NoYW5nZV9ucyA9Ci0JCQkJd2F0ZXJtYXJrcy0+Yy5jc3RhdGVfcHN0YXRl
LnBzdGF0ZV9jaGFuZ2VfbnM7Ci0JCXByb2dfd21fdmFsdWUgPSBjb252ZXJ0X2FuZF9jbGFtcCgK
LQkJCQl3YXRlcm1hcmtzLT5jLmNzdGF0ZV9wc3RhdGUucHN0YXRlX2NoYW5nZV9ucywKKwlpZiAo
c2FmZV90b19sb3dlciB8fCB3YXRlcm1hcmtzLT5jLnB0ZV9tZXRhX3VyZ2VudF9ucyA+IGh1YmJ1
YjEtPndhdGVybWFya3MuYy5wdGVfbWV0YV91cmdlbnRfbnMpIHsKKwkJaHViYnViMS0+d2F0ZXJt
YXJrcy5jLnB0ZV9tZXRhX3VyZ2VudF9ucyA9IHdhdGVybWFya3MtPmMucHRlX21ldGFfdXJnZW50
X25zOworCQlwcm9nX3dtX3ZhbHVlID0gY29udmVydF9hbmRfY2xhbXAod2F0ZXJtYXJrcy0+Yy5w
dGVfbWV0YV91cmdlbnRfbnMsCiAJCQkJcmVmY2xrX21oeiwgMHgxZmZmZmYpOwotCQlSRUdfU0VU
KERDSFVCQlVCX0FSQl9BTExPV19EUkFNX0NMS19DSEFOR0VfV0FURVJNQVJLX0MsIDAsCi0JCQkJ
RENIVUJCVUJfQVJCX0FMTE9XX0RSQU1fQ0xLX0NIQU5HRV9XQVRFUk1BUktfQywgcHJvZ193bV92
YWx1ZSk7Ci0JCURDX0xPR19CQU5EV0lEVEhfQ0FMQ1MoIkRSQU1fQ0xLX0NIQU5HRV9XQVRFUk1B
UktfQyBjYWxjdWxhdGVkID0lZFxuIgotCQkJIkhXIHJlZ2lzdGVyIHZhbHVlID0gMHgleFxuXG4i
LAotCQkJd2F0ZXJtYXJrcy0+Yy5jc3RhdGVfcHN0YXRlLnBzdGF0ZV9jaGFuZ2VfbnMsIHByb2df
d21fdmFsdWUpOworCQlSRUdfV1JJVEUoRENIVUJCVUJfQVJCX1BURV9NRVRBX1VSR0VOQ1lfV0FU
RVJNQVJLX0MsIHByb2dfd21fdmFsdWUpOworCQlEQ19MT0dfQkFORFdJRFRIX0NBTENTKCJQVEVf
TUVUQV9VUkdFTkNZX1dBVEVSTUFSS19DIGNhbGN1bGF0ZWQgPSVkXG4iCisJCQkiSFcgcmVnaXN0
ZXIgdmFsdWUgPSAweCV4XG4iLAorCQkJd2F0ZXJtYXJrcy0+Yy5wdGVfbWV0YV91cmdlbnRfbnMs
IHByb2dfd21fdmFsdWUpOwogCX0KIAogCS8qIGNsb2NrIHN0YXRlIEQgKi8KQEAgLTQ5OCw0OCAr
MzU1LDE5OSBAQCB2b2lkIGh1YmJ1YjFfcHJvZ3JhbV93YXRlcm1hcmtzKAogCQkJd2F0ZXJtYXJr
cy0+ZC51cmdlbnRfbnMsIHByb2dfd21fdmFsdWUpOwogCX0KIAotCWlmIChSRUcoRENIVUJCVUJf
QVJCX1BURV9NRVRBX1VSR0VOQ1lfV0FURVJNQVJLX0QpKSB7Ci0JCWlmIChzYWZlX3RvX2xvd2Vy
IHx8IHdhdGVybWFya3MtPmQucHRlX21ldGFfdXJnZW50X25zID4gaHViYnViMS0+d2F0ZXJtYXJr
cy5kLnB0ZV9tZXRhX3VyZ2VudF9ucykgewotCQkJaHViYnViMS0+d2F0ZXJtYXJrcy5kLnB0ZV9t
ZXRhX3VyZ2VudF9ucyA9IHdhdGVybWFya3MtPmQucHRlX21ldGFfdXJnZW50X25zOwotCQkJcHJv
Z193bV92YWx1ZSA9IGNvbnZlcnRfYW5kX2NsYW1wKHdhdGVybWFya3MtPmQucHRlX21ldGFfdXJn
ZW50X25zLAotCQkJCQlyZWZjbGtfbWh6LCAweDFmZmZmZik7Ci0JCQlSRUdfV1JJVEUoRENIVUJC
VUJfQVJCX1BURV9NRVRBX1VSR0VOQ1lfV0FURVJNQVJLX0QsIHByb2dfd21fdmFsdWUpOwotCQkJ
RENfTE9HX0JBTkRXSURUSF9DQUxDUygiUFRFX01FVEFfVVJHRU5DWV9XQVRFUk1BUktfRCBjYWxj
dWxhdGVkID0lZFxuIgotCQkJCSJIVyByZWdpc3RlciB2YWx1ZSA9IDB4JXhcbiIsCi0JCQkJd2F0
ZXJtYXJrcy0+ZC5wdGVfbWV0YV91cmdlbnRfbnMsIHByb2dfd21fdmFsdWUpOwotCQl9CisJaWYg
KHNhZmVfdG9fbG93ZXIgfHwgd2F0ZXJtYXJrcy0+ZC5wdGVfbWV0YV91cmdlbnRfbnMgPiBodWJi
dWIxLT53YXRlcm1hcmtzLmQucHRlX21ldGFfdXJnZW50X25zKSB7CisJCWh1YmJ1YjEtPndhdGVy
bWFya3MuZC5wdGVfbWV0YV91cmdlbnRfbnMgPSB3YXRlcm1hcmtzLT5kLnB0ZV9tZXRhX3VyZ2Vu
dF9uczsKKwkJcHJvZ193bV92YWx1ZSA9IGNvbnZlcnRfYW5kX2NsYW1wKHdhdGVybWFya3MtPmQu
cHRlX21ldGFfdXJnZW50X25zLAorCQkJCXJlZmNsa19taHosIDB4MWZmZmZmKTsKKwkJUkVHX1dS
SVRFKERDSFVCQlVCX0FSQl9QVEVfTUVUQV9VUkdFTkNZX1dBVEVSTUFSS19ELCBwcm9nX3dtX3Zh
bHVlKTsKKwkJRENfTE9HX0JBTkRXSURUSF9DQUxDUygiUFRFX01FVEFfVVJHRU5DWV9XQVRFUk1B
UktfRCBjYWxjdWxhdGVkID0lZFxuIgorCQkJIkhXIHJlZ2lzdGVyIHZhbHVlID0gMHgleFxuIiwK
KwkJCXdhdGVybWFya3MtPmQucHRlX21ldGFfdXJnZW50X25zLCBwcm9nX3dtX3ZhbHVlKTsKKwl9
Cit9CisKK3ZvaWQgaHViYnViMV9wcm9ncmFtX3N0dXR0ZXJfd2F0ZXJtYXJrcygKKwkJc3RydWN0
IGh1YmJ1YiAqaHViYnViLAorCQlzdHJ1Y3QgZGNuX3dhdGVybWFya19zZXQgKndhdGVybWFya3Ms
CisJCXVuc2lnbmVkIGludCByZWZjbGtfbWh6LAorCQlib29sIHNhZmVfdG9fbG93ZXIpCit7CisJ
c3RydWN0IGRjbjEwX2h1YmJ1YiAqaHViYnViMSA9IFRPX0RDTjEwX0hVQkJVQihodWJidWIpOwor
CXVpbnQzMl90IHByb2dfd21fdmFsdWU7CisKKwkvKiBjbG9jayBzdGF0ZSBBICovCisJaWYgKHNh
ZmVfdG9fbG93ZXIgfHwgd2F0ZXJtYXJrcy0+YS5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9lbnRlcl9w
bHVzX2V4aXRfbnMKKwkJCT4gaHViYnViMS0+d2F0ZXJtYXJrcy5hLmNzdGF0ZV9wc3RhdGUuY3N0
YXRlX2VudGVyX3BsdXNfZXhpdF9ucykgeworCQlodWJidWIxLT53YXRlcm1hcmtzLmEuY3N0YXRl
X3BzdGF0ZS5jc3RhdGVfZW50ZXJfcGx1c19leGl0X25zID0KKwkJCQl3YXRlcm1hcmtzLT5hLmNz
dGF0ZV9wc3RhdGUuY3N0YXRlX2VudGVyX3BsdXNfZXhpdF9uczsKKwkJcHJvZ193bV92YWx1ZSA9
IGNvbnZlcnRfYW5kX2NsYW1wKAorCQkJCXdhdGVybWFya3MtPmEuY3N0YXRlX3BzdGF0ZS5jc3Rh
dGVfZW50ZXJfcGx1c19leGl0X25zLAorCQkJCXJlZmNsa19taHosIDB4MWZmZmZmKTsKKwkJUkVH
X1NFVChEQ0hVQkJVQl9BUkJfQUxMT1dfU1JfRU5URVJfV0FURVJNQVJLX0EsIDAsCisJCQkJRENI
VUJCVUJfQVJCX0FMTE9XX1NSX0VOVEVSX1dBVEVSTUFSS19BLCBwcm9nX3dtX3ZhbHVlKTsKKwkJ
RENfTE9HX0JBTkRXSURUSF9DQUxDUygiU1JfRU5URVJfRVhJVF9XQVRFUk1BUktfQSBjYWxjdWxh
dGVkID0lZFxuIgorCQkJIkhXIHJlZ2lzdGVyIHZhbHVlID0gMHgleFxuIiwKKwkJCXdhdGVybWFy
a3MtPmEuY3N0YXRlX3BzdGF0ZS5jc3RhdGVfZW50ZXJfcGx1c19leGl0X25zLCBwcm9nX3dtX3Zh
bHVlKTsKIAl9CiAKLQlpZiAoUkVHKERDSFVCQlVCX0FSQl9BTExPV19TUl9FTlRFUl9XQVRFUk1B
UktfRCkpIHsKLQkJaWYgKHNhZmVfdG9fbG93ZXIgfHwgd2F0ZXJtYXJrcy0+ZC5jc3RhdGVfcHN0
YXRlLmNzdGF0ZV9lbnRlcl9wbHVzX2V4aXRfbnMKLQkJCQk+IGh1YmJ1YjEtPndhdGVybWFya3Mu
ZC5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9lbnRlcl9wbHVzX2V4aXRfbnMpIHsKLQkJCWh1YmJ1YjEt
PndhdGVybWFya3MuZC5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9lbnRlcl9wbHVzX2V4aXRfbnMgPQot
CQkJCQl3YXRlcm1hcmtzLT5kLmNzdGF0ZV9wc3RhdGUuY3N0YXRlX2VudGVyX3BsdXNfZXhpdF9u
czsKLQkJCXByb2dfd21fdmFsdWUgPSBjb252ZXJ0X2FuZF9jbGFtcCgKLQkJCQkJd2F0ZXJtYXJr
cy0+ZC5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9lbnRlcl9wbHVzX2V4aXRfbnMsCi0JCQkJCXJlZmNs
a19taHosIDB4MWZmZmZmKTsKLQkJCVJFR19TRVQoRENIVUJCVUJfQVJCX0FMTE9XX1NSX0VOVEVS
X1dBVEVSTUFSS19ELCAwLAotCQkJCQlEQ0hVQkJVQl9BUkJfQUxMT1dfU1JfRU5URVJfV0FURVJN
QVJLX0QsIHByb2dfd21fdmFsdWUpOwotCQkJRENfTE9HX0JBTkRXSURUSF9DQUxDUygiU1JfRU5U
RVJfRVhJVF9XQVRFUk1BUktfRCBjYWxjdWxhdGVkID0lZFxuIgotCQkJCSJIVyByZWdpc3RlciB2
YWx1ZSA9IDB4JXhcbiIsCi0JCQkJd2F0ZXJtYXJrcy0+ZC5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9l
bnRlcl9wbHVzX2V4aXRfbnMsIHByb2dfd21fdmFsdWUpOwotCQl9CisJaWYgKHNhZmVfdG9fbG93
ZXIgfHwgd2F0ZXJtYXJrcy0+YS5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9leGl0X25zCisJCQk+IGh1
YmJ1YjEtPndhdGVybWFya3MuYS5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9leGl0X25zKSB7CisJCWh1
YmJ1YjEtPndhdGVybWFya3MuYS5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9leGl0X25zID0KKwkJCQl3
YXRlcm1hcmtzLT5hLmNzdGF0ZV9wc3RhdGUuY3N0YXRlX2V4aXRfbnM7CisJCXByb2dfd21fdmFs
dWUgPSBjb252ZXJ0X2FuZF9jbGFtcCgKKwkJCQl3YXRlcm1hcmtzLT5hLmNzdGF0ZV9wc3RhdGUu
Y3N0YXRlX2V4aXRfbnMsCisJCQkJcmVmY2xrX21oeiwgMHgxZmZmZmYpOworCQlSRUdfU0VUKERD
SFVCQlVCX0FSQl9BTExPV19TUl9FWElUX1dBVEVSTUFSS19BLCAwLAorCQkJCURDSFVCQlVCX0FS
Ql9BTExPV19TUl9FWElUX1dBVEVSTUFSS19BLCBwcm9nX3dtX3ZhbHVlKTsKKwkJRENfTE9HX0JB
TkRXSURUSF9DQUxDUygiU1JfRVhJVF9XQVRFUk1BUktfQSBjYWxjdWxhdGVkID0lZFxuIgorCQkJ
IkhXIHJlZ2lzdGVyIHZhbHVlID0gMHgleFxuIiwKKwkJCXdhdGVybWFya3MtPmEuY3N0YXRlX3Bz
dGF0ZS5jc3RhdGVfZXhpdF9ucywgcHJvZ193bV92YWx1ZSk7CisJfQogCi0JCWlmIChzYWZlX3Rv
X2xvd2VyIHx8IHdhdGVybWFya3MtPmQuY3N0YXRlX3BzdGF0ZS5jc3RhdGVfZXhpdF9ucwotCQkJ
CT4gaHViYnViMS0+d2F0ZXJtYXJrcy5kLmNzdGF0ZV9wc3RhdGUuY3N0YXRlX2V4aXRfbnMpIHsK
LQkJCWh1YmJ1YjEtPndhdGVybWFya3MuZC5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9leGl0X25zID0K
LQkJCQkJd2F0ZXJtYXJrcy0+ZC5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9leGl0X25zOwotCQkJcHJv
Z193bV92YWx1ZSA9IGNvbnZlcnRfYW5kX2NsYW1wKAotCQkJCQl3YXRlcm1hcmtzLT5kLmNzdGF0
ZV9wc3RhdGUuY3N0YXRlX2V4aXRfbnMsCi0JCQkJCXJlZmNsa19taHosIDB4MWZmZmZmKTsKLQkJ
CVJFR19TRVQoRENIVUJCVUJfQVJCX0FMTE9XX1NSX0VYSVRfV0FURVJNQVJLX0QsIDAsCi0JCQkJ
CURDSFVCQlVCX0FSQl9BTExPV19TUl9FWElUX1dBVEVSTUFSS19ELCBwcm9nX3dtX3ZhbHVlKTsK
LQkJCURDX0xPR19CQU5EV0lEVEhfQ0FMQ1MoIlNSX0VYSVRfV0FURVJNQVJLX0QgY2FsY3VsYXRl
ZCA9JWRcbiIKLQkJCQkiSFcgcmVnaXN0ZXIgdmFsdWUgPSAweCV4XG4iLAotCQkJCXdhdGVybWFy
a3MtPmQuY3N0YXRlX3BzdGF0ZS5jc3RhdGVfZXhpdF9ucywgcHJvZ193bV92YWx1ZSk7Ci0JCX0K
KwkvKiBjbG9jayBzdGF0ZSBCICovCisJaWYgKHNhZmVfdG9fbG93ZXIgfHwgd2F0ZXJtYXJrcy0+
Yi5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9lbnRlcl9wbHVzX2V4aXRfbnMKKwkJCT4gaHViYnViMS0+
d2F0ZXJtYXJrcy5iLmNzdGF0ZV9wc3RhdGUuY3N0YXRlX2VudGVyX3BsdXNfZXhpdF9ucykgewor
CQlodWJidWIxLT53YXRlcm1hcmtzLmIuY3N0YXRlX3BzdGF0ZS5jc3RhdGVfZW50ZXJfcGx1c19l
eGl0X25zID0KKwkJCQl3YXRlcm1hcmtzLT5iLmNzdGF0ZV9wc3RhdGUuY3N0YXRlX2VudGVyX3Bs
dXNfZXhpdF9uczsKKwkJcHJvZ193bV92YWx1ZSA9IGNvbnZlcnRfYW5kX2NsYW1wKAorCQkJCXdh
dGVybWFya3MtPmIuY3N0YXRlX3BzdGF0ZS5jc3RhdGVfZW50ZXJfcGx1c19leGl0X25zLAorCQkJ
CXJlZmNsa19taHosIDB4MWZmZmZmKTsKKwkJUkVHX1NFVChEQ0hVQkJVQl9BUkJfQUxMT1dfU1Jf
RU5URVJfV0FURVJNQVJLX0IsIDAsCisJCQkJRENIVUJCVUJfQVJCX0FMTE9XX1NSX0VOVEVSX1dB
VEVSTUFSS19CLCBwcm9nX3dtX3ZhbHVlKTsKKwkJRENfTE9HX0JBTkRXSURUSF9DQUxDUygiU1Jf
RU5URVJfRVhJVF9XQVRFUk1BUktfQiBjYWxjdWxhdGVkID0lZFxuIgorCQkJIkhXIHJlZ2lzdGVy
IHZhbHVlID0gMHgleFxuIiwKKwkJCXdhdGVybWFya3MtPmIuY3N0YXRlX3BzdGF0ZS5jc3RhdGVf
ZW50ZXJfcGx1c19leGl0X25zLCBwcm9nX3dtX3ZhbHVlKTsKIAl9CiAKKwlpZiAoc2FmZV90b19s
b3dlciB8fCB3YXRlcm1hcmtzLT5iLmNzdGF0ZV9wc3RhdGUuY3N0YXRlX2V4aXRfbnMKKwkJCT4g
aHViYnViMS0+d2F0ZXJtYXJrcy5iLmNzdGF0ZV9wc3RhdGUuY3N0YXRlX2V4aXRfbnMpIHsKKwkJ
aHViYnViMS0+d2F0ZXJtYXJrcy5iLmNzdGF0ZV9wc3RhdGUuY3N0YXRlX2V4aXRfbnMgPQorCQkJ
CXdhdGVybWFya3MtPmIuY3N0YXRlX3BzdGF0ZS5jc3RhdGVfZXhpdF9uczsKKwkJcHJvZ193bV92
YWx1ZSA9IGNvbnZlcnRfYW5kX2NsYW1wKAorCQkJCXdhdGVybWFya3MtPmIuY3N0YXRlX3BzdGF0
ZS5jc3RhdGVfZXhpdF9ucywKKwkJCQlyZWZjbGtfbWh6LCAweDFmZmZmZik7CisJCVJFR19TRVQo
RENIVUJCVUJfQVJCX0FMTE9XX1NSX0VYSVRfV0FURVJNQVJLX0IsIDAsCisJCQkJRENIVUJCVUJf
QVJCX0FMTE9XX1NSX0VYSVRfV0FURVJNQVJLX0IsIHByb2dfd21fdmFsdWUpOworCQlEQ19MT0df
QkFORFdJRFRIX0NBTENTKCJTUl9FWElUX1dBVEVSTUFSS19CIGNhbGN1bGF0ZWQgPSVkXG4iCisJ
CQkiSFcgcmVnaXN0ZXIgdmFsdWUgPSAweCV4XG4iLAorCQkJd2F0ZXJtYXJrcy0+Yi5jc3RhdGVf
cHN0YXRlLmNzdGF0ZV9leGl0X25zLCBwcm9nX3dtX3ZhbHVlKTsKKwl9CisKKwkvKiBjbG9jayBz
dGF0ZSBDICovCisJaWYgKHNhZmVfdG9fbG93ZXIgfHwgd2F0ZXJtYXJrcy0+Yy5jc3RhdGVfcHN0
YXRlLmNzdGF0ZV9lbnRlcl9wbHVzX2V4aXRfbnMKKwkJCT4gaHViYnViMS0+d2F0ZXJtYXJrcy5j
LmNzdGF0ZV9wc3RhdGUuY3N0YXRlX2VudGVyX3BsdXNfZXhpdF9ucykgeworCQlodWJidWIxLT53
YXRlcm1hcmtzLmMuY3N0YXRlX3BzdGF0ZS5jc3RhdGVfZW50ZXJfcGx1c19leGl0X25zID0KKwkJ
CQl3YXRlcm1hcmtzLT5jLmNzdGF0ZV9wc3RhdGUuY3N0YXRlX2VudGVyX3BsdXNfZXhpdF9uczsK
KwkJcHJvZ193bV92YWx1ZSA9IGNvbnZlcnRfYW5kX2NsYW1wKAorCQkJCXdhdGVybWFya3MtPmMu
Y3N0YXRlX3BzdGF0ZS5jc3RhdGVfZW50ZXJfcGx1c19leGl0X25zLAorCQkJCXJlZmNsa19taHos
IDB4MWZmZmZmKTsKKwkJUkVHX1NFVChEQ0hVQkJVQl9BUkJfQUxMT1dfU1JfRU5URVJfV0FURVJN
QVJLX0MsIDAsCisJCQkJRENIVUJCVUJfQVJCX0FMTE9XX1NSX0VOVEVSX1dBVEVSTUFSS19DLCBw
cm9nX3dtX3ZhbHVlKTsKKwkJRENfTE9HX0JBTkRXSURUSF9DQUxDUygiU1JfRU5URVJfRVhJVF9X
QVRFUk1BUktfQyBjYWxjdWxhdGVkID0lZFxuIgorCQkJIkhXIHJlZ2lzdGVyIHZhbHVlID0gMHgl
eFxuIiwKKwkJCXdhdGVybWFya3MtPmMuY3N0YXRlX3BzdGF0ZS5jc3RhdGVfZW50ZXJfcGx1c19l
eGl0X25zLCBwcm9nX3dtX3ZhbHVlKTsKKwl9CisKKwlpZiAoc2FmZV90b19sb3dlciB8fCB3YXRl
cm1hcmtzLT5jLmNzdGF0ZV9wc3RhdGUuY3N0YXRlX2V4aXRfbnMKKwkJCT4gaHViYnViMS0+d2F0
ZXJtYXJrcy5jLmNzdGF0ZV9wc3RhdGUuY3N0YXRlX2V4aXRfbnMpIHsKKwkJaHViYnViMS0+d2F0
ZXJtYXJrcy5jLmNzdGF0ZV9wc3RhdGUuY3N0YXRlX2V4aXRfbnMgPQorCQkJCXdhdGVybWFya3Mt
PmMuY3N0YXRlX3BzdGF0ZS5jc3RhdGVfZXhpdF9uczsKKwkJcHJvZ193bV92YWx1ZSA9IGNvbnZl
cnRfYW5kX2NsYW1wKAorCQkJCXdhdGVybWFya3MtPmMuY3N0YXRlX3BzdGF0ZS5jc3RhdGVfZXhp
dF9ucywKKwkJCQlyZWZjbGtfbWh6LCAweDFmZmZmZik7CisJCVJFR19TRVQoRENIVUJCVUJfQVJC
X0FMTE9XX1NSX0VYSVRfV0FURVJNQVJLX0MsIDAsCisJCQkJRENIVUJCVUJfQVJCX0FMTE9XX1NS
X0VYSVRfV0FURVJNQVJLX0MsIHByb2dfd21fdmFsdWUpOworCQlEQ19MT0dfQkFORFdJRFRIX0NB
TENTKCJTUl9FWElUX1dBVEVSTUFSS19DIGNhbGN1bGF0ZWQgPSVkXG4iCisJCQkiSFcgcmVnaXN0
ZXIgdmFsdWUgPSAweCV4XG4iLAorCQkJd2F0ZXJtYXJrcy0+Yy5jc3RhdGVfcHN0YXRlLmNzdGF0
ZV9leGl0X25zLCBwcm9nX3dtX3ZhbHVlKTsKKwl9CisKKwkvKiBjbG9jayBzdGF0ZSBEICovCisJ
aWYgKHNhZmVfdG9fbG93ZXIgfHwgd2F0ZXJtYXJrcy0+ZC5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9l
bnRlcl9wbHVzX2V4aXRfbnMKKwkJCT4gaHViYnViMS0+d2F0ZXJtYXJrcy5kLmNzdGF0ZV9wc3Rh
dGUuY3N0YXRlX2VudGVyX3BsdXNfZXhpdF9ucykgeworCQlodWJidWIxLT53YXRlcm1hcmtzLmQu
Y3N0YXRlX3BzdGF0ZS5jc3RhdGVfZW50ZXJfcGx1c19leGl0X25zID0KKwkJCQl3YXRlcm1hcmtz
LT5kLmNzdGF0ZV9wc3RhdGUuY3N0YXRlX2VudGVyX3BsdXNfZXhpdF9uczsKKwkJcHJvZ193bV92
YWx1ZSA9IGNvbnZlcnRfYW5kX2NsYW1wKAorCQkJCXdhdGVybWFya3MtPmQuY3N0YXRlX3BzdGF0
ZS5jc3RhdGVfZW50ZXJfcGx1c19leGl0X25zLAorCQkJCXJlZmNsa19taHosIDB4MWZmZmZmKTsK
KwkJUkVHX1NFVChEQ0hVQkJVQl9BUkJfQUxMT1dfU1JfRU5URVJfV0FURVJNQVJLX0QsIDAsCisJ
CQkJRENIVUJCVUJfQVJCX0FMTE9XX1NSX0VOVEVSX1dBVEVSTUFSS19ELCBwcm9nX3dtX3ZhbHVl
KTsKKwkJRENfTE9HX0JBTkRXSURUSF9DQUxDUygiU1JfRU5URVJfRVhJVF9XQVRFUk1BUktfRCBj
YWxjdWxhdGVkID0lZFxuIgorCQkJIkhXIHJlZ2lzdGVyIHZhbHVlID0gMHgleFxuIiwKKwkJCXdh
dGVybWFya3MtPmQuY3N0YXRlX3BzdGF0ZS5jc3RhdGVfZW50ZXJfcGx1c19leGl0X25zLCBwcm9n
X3dtX3ZhbHVlKTsKKwl9CisKKwlpZiAoc2FmZV90b19sb3dlciB8fCB3YXRlcm1hcmtzLT5kLmNz
dGF0ZV9wc3RhdGUuY3N0YXRlX2V4aXRfbnMKKwkJCT4gaHViYnViMS0+d2F0ZXJtYXJrcy5kLmNz
dGF0ZV9wc3RhdGUuY3N0YXRlX2V4aXRfbnMpIHsKKwkJaHViYnViMS0+d2F0ZXJtYXJrcy5kLmNz
dGF0ZV9wc3RhdGUuY3N0YXRlX2V4aXRfbnMgPQorCQkJCXdhdGVybWFya3MtPmQuY3N0YXRlX3Bz
dGF0ZS5jc3RhdGVfZXhpdF9uczsKKwkJcHJvZ193bV92YWx1ZSA9IGNvbnZlcnRfYW5kX2NsYW1w
KAorCQkJCXdhdGVybWFya3MtPmQuY3N0YXRlX3BzdGF0ZS5jc3RhdGVfZXhpdF9ucywKKwkJCQly
ZWZjbGtfbWh6LCAweDFmZmZmZik7CisJCVJFR19TRVQoRENIVUJCVUJfQVJCX0FMTE9XX1NSX0VY
SVRfV0FURVJNQVJLX0QsIDAsCisJCQkJRENIVUJCVUJfQVJCX0FMTE9XX1NSX0VYSVRfV0FURVJN
QVJLX0QsIHByb2dfd21fdmFsdWUpOworCQlEQ19MT0dfQkFORFdJRFRIX0NBTENTKCJTUl9FWElU
X1dBVEVSTUFSS19EIGNhbGN1bGF0ZWQgPSVkXG4iCisJCQkiSFcgcmVnaXN0ZXIgdmFsdWUgPSAw
eCV4XG4iLAorCQkJd2F0ZXJtYXJrcy0+ZC5jc3RhdGVfcHN0YXRlLmNzdGF0ZV9leGl0X25zLCBw
cm9nX3dtX3ZhbHVlKTsKKwl9CisKK30KKwordm9pZCBodWJidWIxX3Byb2dyYW1fcHN0YXRlX3dh
dGVybWFya3MoCisJCXN0cnVjdCBodWJidWIgKmh1YmJ1YiwKKwkJc3RydWN0IGRjbl93YXRlcm1h
cmtfc2V0ICp3YXRlcm1hcmtzLAorCQl1bnNpZ25lZCBpbnQgcmVmY2xrX21oeiwKKwkJYm9vbCBz
YWZlX3RvX2xvd2VyKQoreworCXN0cnVjdCBkY24xMF9odWJidWIgKmh1YmJ1YjEgPSBUT19EQ04x
MF9IVUJCVUIoaHViYnViKTsKKwl1aW50MzJfdCBwcm9nX3dtX3ZhbHVlOworCisJLyogY2xvY2sg
c3RhdGUgQSAqLworCWlmIChzYWZlX3RvX2xvd2VyIHx8IHdhdGVybWFya3MtPmEuY3N0YXRlX3Bz
dGF0ZS5wc3RhdGVfY2hhbmdlX25zCisJCQk+IGh1YmJ1YjEtPndhdGVybWFya3MuYS5jc3RhdGVf
cHN0YXRlLnBzdGF0ZV9jaGFuZ2VfbnMpIHsKKwkJaHViYnViMS0+d2F0ZXJtYXJrcy5hLmNzdGF0
ZV9wc3RhdGUucHN0YXRlX2NoYW5nZV9ucyA9CisJCQkJd2F0ZXJtYXJrcy0+YS5jc3RhdGVfcHN0
YXRlLnBzdGF0ZV9jaGFuZ2VfbnM7CisJCXByb2dfd21fdmFsdWUgPSBjb252ZXJ0X2FuZF9jbGFt
cCgKKwkJCQl3YXRlcm1hcmtzLT5hLmNzdGF0ZV9wc3RhdGUucHN0YXRlX2NoYW5nZV9ucywKKwkJ
CQlyZWZjbGtfbWh6LCAweDFmZmZmZik7CisJCVJFR19TRVQoRENIVUJCVUJfQVJCX0FMTE9XX0RS
QU1fQ0xLX0NIQU5HRV9XQVRFUk1BUktfQSwgMCwKKwkJCQlEQ0hVQkJVQl9BUkJfQUxMT1dfRFJB
TV9DTEtfQ0hBTkdFX1dBVEVSTUFSS19BLCBwcm9nX3dtX3ZhbHVlKTsKKwkJRENfTE9HX0JBTkRX
SURUSF9DQUxDUygiRFJBTV9DTEtfQ0hBTkdFX1dBVEVSTUFSS19BIGNhbGN1bGF0ZWQgPSVkXG4i
CisJCQkiSFcgcmVnaXN0ZXIgdmFsdWUgPSAweCV4XG5cbiIsCisJCQl3YXRlcm1hcmtzLT5hLmNz
dGF0ZV9wc3RhdGUucHN0YXRlX2NoYW5nZV9ucywgcHJvZ193bV92YWx1ZSk7CisJfQorCisJLyog
Y2xvY2sgc3RhdGUgQiAqLworCWlmIChzYWZlX3RvX2xvd2VyIHx8IHdhdGVybWFya3MtPmIuY3N0
YXRlX3BzdGF0ZS5wc3RhdGVfY2hhbmdlX25zCisJCQk+IGh1YmJ1YjEtPndhdGVybWFya3MuYi5j
c3RhdGVfcHN0YXRlLnBzdGF0ZV9jaGFuZ2VfbnMpIHsKKwkJaHViYnViMS0+d2F0ZXJtYXJrcy5i
LmNzdGF0ZV9wc3RhdGUucHN0YXRlX2NoYW5nZV9ucyA9CisJCQkJd2F0ZXJtYXJrcy0+Yi5jc3Rh
dGVfcHN0YXRlLnBzdGF0ZV9jaGFuZ2VfbnM7CisJCXByb2dfd21fdmFsdWUgPSBjb252ZXJ0X2Fu
ZF9jbGFtcCgKKwkJCQl3YXRlcm1hcmtzLT5iLmNzdGF0ZV9wc3RhdGUucHN0YXRlX2NoYW5nZV9u
cywKKwkJCQlyZWZjbGtfbWh6LCAweDFmZmZmZik7CisJCVJFR19TRVQoRENIVUJCVUJfQVJCX0FM
TE9XX0RSQU1fQ0xLX0NIQU5HRV9XQVRFUk1BUktfQiwgMCwKKwkJCQlEQ0hVQkJVQl9BUkJfQUxM
T1dfRFJBTV9DTEtfQ0hBTkdFX1dBVEVSTUFSS19CLCBwcm9nX3dtX3ZhbHVlKTsKKwkJRENfTE9H
X0JBTkRXSURUSF9DQUxDUygiRFJBTV9DTEtfQ0hBTkdFX1dBVEVSTUFSS19CIGNhbGN1bGF0ZWQg
PSVkXG4iCisJCQkiSFcgcmVnaXN0ZXIgdmFsdWUgPSAweCV4XG5cbiIsCisJCQl3YXRlcm1hcmtz
LT5iLmNzdGF0ZV9wc3RhdGUucHN0YXRlX2NoYW5nZV9ucywgcHJvZ193bV92YWx1ZSk7CisJfQor
CisJLyogY2xvY2sgc3RhdGUgQyAqLworCWlmIChzYWZlX3RvX2xvd2VyIHx8IHdhdGVybWFya3Mt
PmMuY3N0YXRlX3BzdGF0ZS5wc3RhdGVfY2hhbmdlX25zCisJCQk+IGh1YmJ1YjEtPndhdGVybWFy
a3MuYy5jc3RhdGVfcHN0YXRlLnBzdGF0ZV9jaGFuZ2VfbnMpIHsKKwkJaHViYnViMS0+d2F0ZXJt
YXJrcy5jLmNzdGF0ZV9wc3RhdGUucHN0YXRlX2NoYW5nZV9ucyA9CisJCQkJd2F0ZXJtYXJrcy0+
Yy5jc3RhdGVfcHN0YXRlLnBzdGF0ZV9jaGFuZ2VfbnM7CisJCXByb2dfd21fdmFsdWUgPSBjb252
ZXJ0X2FuZF9jbGFtcCgKKwkJCQl3YXRlcm1hcmtzLT5jLmNzdGF0ZV9wc3RhdGUucHN0YXRlX2No
YW5nZV9ucywKKwkJCQlyZWZjbGtfbWh6LCAweDFmZmZmZik7CisJCVJFR19TRVQoRENIVUJCVUJf
QVJCX0FMTE9XX0RSQU1fQ0xLX0NIQU5HRV9XQVRFUk1BUktfQywgMCwKKwkJCQlEQ0hVQkJVQl9B
UkJfQUxMT1dfRFJBTV9DTEtfQ0hBTkdFX1dBVEVSTUFSS19DLCBwcm9nX3dtX3ZhbHVlKTsKKwkJ
RENfTE9HX0JBTkRXSURUSF9DQUxDUygiRFJBTV9DTEtfQ0hBTkdFX1dBVEVSTUFSS19DIGNhbGN1
bGF0ZWQgPSVkXG4iCisJCQkiSFcgcmVnaXN0ZXIgdmFsdWUgPSAweCV4XG5cbiIsCisJCQl3YXRl
cm1hcmtzLT5jLmNzdGF0ZV9wc3RhdGUucHN0YXRlX2NoYW5nZV9ucywgcHJvZ193bV92YWx1ZSk7
CisJfQorCisJLyogY2xvY2sgc3RhdGUgRCAqLwogCWlmIChzYWZlX3RvX2xvd2VyIHx8IHdhdGVy
bWFya3MtPmQuY3N0YXRlX3BzdGF0ZS5wc3RhdGVfY2hhbmdlX25zCiAJCQk+IGh1YmJ1YjEtPndh
dGVybWFya3MuZC5jc3RhdGVfcHN0YXRlLnBzdGF0ZV9jaGFuZ2VfbnMpIHsKIAkJaHViYnViMS0+
d2F0ZXJtYXJrcy5kLmNzdGF0ZV9wc3RhdGUucHN0YXRlX2NoYW5nZV9ucyA9CkBAIC01NTMsNiAr
NTYxLDIyIEBAIHZvaWQgaHViYnViMV9wcm9ncmFtX3dhdGVybWFya3MoCiAJCQkiSFcgcmVnaXN0
ZXIgdmFsdWUgPSAweCV4XG5cbiIsCiAJCQl3YXRlcm1hcmtzLT5kLmNzdGF0ZV9wc3RhdGUucHN0
YXRlX2NoYW5nZV9ucywgcHJvZ193bV92YWx1ZSk7CiAJfQorfQorCit2b2lkIGh1YmJ1YjFfcHJv
Z3JhbV93YXRlcm1hcmtzKAorCQlzdHJ1Y3QgaHViYnViICpodWJidWIsCisJCXN0cnVjdCBkY25f
d2F0ZXJtYXJrX3NldCAqd2F0ZXJtYXJrcywKKwkJdW5zaWduZWQgaW50IHJlZmNsa19taHosCisJ
CWJvb2wgc2FmZV90b19sb3dlcikKK3sKKwlzdHJ1Y3QgZGNuMTBfaHViYnViICpodWJidWIxID0g
VE9fRENOMTBfSFVCQlVCKGh1YmJ1Yik7CisJLyoKKwkgKiBOZWVkIHRvIGNsYW1wIHRvIG1heCBv
ZiB0aGUgcmVnaXN0ZXIgdmFsdWVzIChpLmUuIG5vIHdyYXApCisJICogZm9yIGRjbjEsIGFsbCB3
bSByZWdpc3RlcnMgYXJlIDIxLWJpdCB3aWRlCisJICovCisJaHViYnViMV9wcm9ncmFtX3VyZ2Vu
dF93YXRlcm1hcmtzKGh1YmJ1Yiwgd2F0ZXJtYXJrcywgcmVmY2xrX21oeiwgc2FmZV90b19sb3dl
cik7CisJaHViYnViMV9wcm9ncmFtX3N0dXR0ZXJfd2F0ZXJtYXJrcyhodWJidWIsIHdhdGVybWFy
a3MsIHJlZmNsa19taHosIHNhZmVfdG9fbG93ZXIpOworCWh1YmJ1YjFfcHJvZ3JhbV9wc3RhdGVf
d2F0ZXJtYXJrcyhodWJidWIsIHdhdGVybWFya3MsIHJlZmNsa19taHosIHNhZmVfdG9fbG93ZXIp
OwogCiAJUkVHX1VQREFURShEQ0hVQkJVQl9BUkJfU0FUX0xFVkVMLAogCQkJRENIVUJCVUJfQVJC
X1NBVF9MRVZFTCwgNjAgKiByZWZjbGtfbWh6KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9odWJidWIuaCBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9odWJidWIuaAppbmRleCA4NTgxMWIyNGE0OTcuLjdj
MjU1OWM5YWUyMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjEwL2RjbjEwX2h1YmJ1Yi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24xMC9kY24xMF9odWJidWIuaApAQCAtMjYyLDQgKzI2MiwyMCBAQCB2b2lkIGh1YmJ1YjFfY29u
c3RydWN0KHN0cnVjdCBodWJidWIgKmh1YmJ1YiwKIAljb25zdCBzdHJ1Y3QgZGNuX2h1YmJ1Yl9z
aGlmdCAqaHViYnViX3NoaWZ0LAogCWNvbnN0IHN0cnVjdCBkY25faHViYnViX21hc2sgKmh1YmJ1
Yl9tYXNrKTsKIAordm9pZCBodWJidWIxX3Byb2dyYW1fdXJnZW50X3dhdGVybWFya3MoCisJCXN0
cnVjdCBodWJidWIgKmh1YmJ1YiwKKwkJc3RydWN0IGRjbl93YXRlcm1hcmtfc2V0ICp3YXRlcm1h
cmtzLAorCQl1bnNpZ25lZCBpbnQgcmVmY2xrX21oeiwKKwkJYm9vbCBzYWZlX3RvX2xvd2VyKTsK
K3ZvaWQgaHViYnViMV9wcm9ncmFtX3N0dXR0ZXJfd2F0ZXJtYXJrcygKKwkJc3RydWN0IGh1YmJ1
YiAqaHViYnViLAorCQlzdHJ1Y3QgZGNuX3dhdGVybWFya19zZXQgKndhdGVybWFya3MsCisJCXVu
c2lnbmVkIGludCByZWZjbGtfbWh6LAorCQlib29sIHNhZmVfdG9fbG93ZXIpOwordm9pZCBodWJi
dWIxX3Byb2dyYW1fcHN0YXRlX3dhdGVybWFya3MoCisJCXN0cnVjdCBodWJidWIgKmh1YmJ1YiwK
KwkJc3RydWN0IGRjbl93YXRlcm1hcmtfc2V0ICp3YXRlcm1hcmtzLAorCQl1bnNpZ25lZCBpbnQg
cmVmY2xrX21oeiwKKwkJYm9vbCBzYWZlX3RvX2xvd2VyKTsKKwogI2VuZGlmCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
