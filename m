Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 311DF69DA2
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46E889BD4;
	Mon, 15 Jul 2019 21:21:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD59489BF3
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nw2C2HZ60U7As3uSJ+fUw/hKzNgpAjEqtp67D0PZ8HwBTTT3hc3sVuzCYe9dKWWjhSeOEvU56+9+jYXPPCDrOnPPFYdFYzEjwDsTn1R3xR8+ESk+Lr4SD+5Emo5if3KZ1ENM1hnU4CFdgzq4DDZQPl4GL2djpKVo7F3Lhj6ODgKmAflyK6rcttI1BkhE7LvcXIzthN/LZUWD96A/UPGy7QaMidPT2WrVs0FnD7E31PVetwLiCYkvIOZKvUTOvAxNxxgZE6aQKFKZTCr2ji/6Xy3N9GvEG1vNoiLjgwdGZQH7zLsLhftRtnDCw/u1t67Wj42/BLCBUJvFN4URQnPVOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fe1bTM9gtS5VBap6sxe1gQOb2zm9cO/fnx230qaqvw=;
 b=CkpB3wLfgLmarE+CxCWY9As6lHj2vqphmJKnUw8aGRrozP0tA7freTWR04U91sxND+oOSLcVcRDvDbfMBTFlqZnsZvmR1Sk9B5kmYLx+bcxOZsn2Pum9H7GfPEgArsxi3Y4wyKdZVoivOkP008ElGO16OE+U2oV84oVayRPnn6N11dfldnQwuaY61lPd7kHmmBP9RVNSjeG1b6BDikyr6l+napuhiOhlfH79zU8GuoCKFujAYzMpCoO8Wsk08o0HPn1U34Dkh0iiixuXnFUoqfVk5/2UQbPU1IG4pmicMtJvit4A8ds7knumU+bkdf/ZdOR5mI+EL7kQovmzVeirog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0042.namprd12.prod.outlook.com (2603:10b6:301:2::28)
 by MN2PR12MB3936.namprd12.prod.outlook.com (2603:10b6:208:16a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:21:23 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by MWHPR12CA0042.outlook.office365.com
 (2603:10b6:301:2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:22 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:22 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:09 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 17/87] drm/amd/display: Split out common HUBP registers and
 code
Date: Mon, 15 Jul 2019 17:19:39 -0400
Message-ID: <20190715212049.4584-18-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(2980300002)(428003)(189003)(199004)(446003)(68736007)(356004)(6666004)(76176011)(6916009)(70586007)(70206006)(51416003)(26005)(486006)(336012)(36756003)(47776003)(126002)(86362001)(476003)(30864003)(2616005)(11346002)(2906002)(49486002)(2870700001)(426003)(53936002)(305945005)(50226002)(4326008)(1076003)(2876002)(54906003)(478600001)(186003)(8676002)(2351001)(81166006)(316002)(50466002)(14444005)(48376002)(81156014)(8936002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3936; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7690e30b-b877-4a80-dc49-08d7096a62f4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3936; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3936:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3936378FAF36ED0149EE0D3F82CF0@MN2PR12MB3936.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: lwKmnuIgHRv5SArAicXuXEdpvPaGTqT+T8epx039wrbqQD8oWiryZ4UwXc7+DlmcjVlpV55ixsPDtSr01eezNguI9a9tb2NRm7MXrf60pzQe7F6E2BGr1sskTbx6PeFVN11sdBQ8AIxrOmiIq5diJnOCvQiB7+knRPZocIa5WoLmRe/6CPbuiteTAHYagEW5+0oNEmLJV1+ipvMFKUksVVbyZQN+JrS8jpAT93ZTiX1mG1i5O+jjl2loOHMPVzJpBRFHVckpza6Mk+ascA1+MFjQGaQrGB3Y8TOo4G5eapOQnB9mml4GbP7gxh1mUqEqU9hDNDYsNAka+U4SOEgTZw8Jg2Jwg1fgxhueTvwKYT6MgoRc51lAOyRmkmnnDioxbbYA/rY202ls2bo0esxnS4EQX6o5O0hfCWJlEyOmyRU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:22.5680 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7690e30b-b877-4a80-dc49-08d7096a62f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3936
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fe1bTM9gtS5VBap6sxe1gQOb2zm9cO/fnx230qaqvw=;
 b=Un5pllodGUkhtJqnOsasAe+vBlcT1zWudNTj3KWjtvz6xfsfCqhFGuxbtZTuPUQyx5ZoL7YE7KKkPPCLyFZSyw5HauHwWvwgmojWq/EQbeOm+WTCXZO3teAlN4PlISgAkq2GVR7H3KE7CclJ7jrFcnTwutbZIxc9qWVXky3ssz0=
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
Cc: Leo Li <sunpeng.li@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KClRoZXJlIGFyZSBzaGFy
ZWQgcmVncyBhbmQgY29kZSBhY3Jvc3MgRENOIGdlbmVyYXRpb25zLiBQdWxsIHRoZW0gb3V0Cmlu
dG8gYSBzaGFyZWQgY29tbW9uIGxvY2F0aW9uLgoKQWxzbywgZXhwb3NlIHNvbWUgZGNuMjAgaW5p
dCBmdW5jdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBDaGFybGVuZSBMaXUgPGNoYXJsZW5lLmxpdUBh
bWQuY29tPgpSZXZpZXdlZC1ieTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hr
aW5AYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIC4u
Li9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfaHdzZXEuaCAgICB8ICAzICstCiAuLi4v
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9odWJwLmMgfCA1MCArKysrKysrKysr
KystLS0tLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9odWJwLmgg
fCAyMyArKysrKystLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1
YnAuaCB8IDIzICsrKysrLS0tLQogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9o
d3NlcS5jICAgIHwgNDMgKysrKysrKysrKysrKysrLQogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9kY24yMF9od3NlcS5oICAgIHwgMTQgKystLS0tCiA2IGZpbGVzIGNoYW5nZWQsIDEwOSBp
bnNlcnRpb25zKCspLCA0NyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9od3NlcS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjZS9kY2VfaHdzZXEuaAppbmRleCBjYjBhMDM3YjFjNGEuLjNhNDlmMWZmYjVk
ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfaHdz
ZXEuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9od3NlcS5o
CkBAIC02OTYsNyArNjk2LDggQEAgc3RydWN0IGRjZV9od3NlcV9yZWdpc3RlcnMgewogCXR5cGUg
RDJWR0FfTU9ERV9FTkFCTEU7IFwKIAl0eXBlIEQzVkdBX01PREVfRU5BQkxFOyBcCiAJdHlwZSBE
NFZHQV9NT0RFX0VOQUJMRTsgXAotCXR5cGUgQVpBTElBX0FVRElPX0RUT19NT0RVTEU7CisJdHlw
ZSBBWkFMSUFfQVVESU9fRFRPX01PRFVMRTtcCisJdHlwZSBIUE9fSERNSVNUUkVBTUNMS19HQVRF
X0RJUzsKIAogc3RydWN0IGRjZV9od3NlcV9zaGlmdCB7CiAJSFdTRVFfUkVHX0ZJRUxEX0xJU1Qo
dWludDhfdCkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24x
MC9kY24xMF9odWJwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNu
MTBfaHVicC5jCmluZGV4IDkzNGJhY2MwYzZhZC4uYTE2MTI4ODE0ZDYyIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHVicC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9odWJwLmMKQEAgLTg0Myw3
ICs4NDMsNyBAQCB2b2lkIG1pbl9zZXRfdmlld3BvcnQoCiAJCSAgUFJJX1ZJRVdQT1JUX1lfU1RB
UlRfQywgdmlld3BvcnRfYy0+eSk7CiB9CiAKLXZvaWQgaHVicDFfcmVhZF9zdGF0ZShzdHJ1Y3Qg
aHVicCAqaHVicCkKK3ZvaWQgaHVicDFfcmVhZF9zdGF0ZV9jb21tb24oc3RydWN0IGh1YnAgKmh1
YnApCiB7CiAJc3RydWN0IGRjbjEwX2h1YnAgKmh1YnAxID0gVE9fRENOMTBfSFVCUChodWJwKTsK
IAlzdHJ1Y3QgZGNuX2h1YnBfc3RhdGUgKnMgPSAmaHVicDEtPnN0YXRlOwpAQCAtODU5LDI0ICs4
NTksNiBAQCB2b2lkIGh1YnAxX3JlYWRfc3RhdGUoc3RydWN0IGh1YnAgKmh1YnApCiAJCQlQUlFf
RVhQQU5TSU9OX01PREUsICZycV9yZWdzLT5wcnFfZXhwYW5zaW9uX21vZGUsCiAJCQlNUlFfRVhQ
QU5TSU9OX01PREUsICZycV9yZWdzLT5tcnFfZXhwYW5zaW9uX21vZGUsCiAJCQlDUlFfRVhQQU5T
SU9OX01PREUsICZycV9yZWdzLT5jcnFfZXhwYW5zaW9uX21vZGUpOwotCVJFR19HRVRfOChEQ0hV
QlBfUkVRX1NJWkVfQ09ORklHLAotCQlDSFVOS19TSVpFLCAmcnFfcmVncy0+cnFfcmVnc19sLmNo
dW5rX3NpemUsCi0JCU1JTl9DSFVOS19TSVpFLCAmcnFfcmVncy0+cnFfcmVnc19sLm1pbl9jaHVu
a19zaXplLAotCQlNRVRBX0NIVU5LX1NJWkUsICZycV9yZWdzLT5ycV9yZWdzX2wubWV0YV9jaHVu
a19zaXplLAotCQlNSU5fTUVUQV9DSFVOS19TSVpFLCAmcnFfcmVncy0+cnFfcmVnc19sLm1pbl9t
ZXRhX2NodW5rX3NpemUsCi0JCURQVEVfR1JPVVBfU0laRSwgJnJxX3JlZ3MtPnJxX3JlZ3NfbC5k
cHRlX2dyb3VwX3NpemUsCi0JCU1QVEVfR1JPVVBfU0laRSwgJnJxX3JlZ3MtPnJxX3JlZ3NfbC5t
cHRlX2dyb3VwX3NpemUsCi0JCVNXQVRIX0hFSUdIVCwgJnJxX3JlZ3MtPnJxX3JlZ3NfbC5zd2F0
aF9oZWlnaHQsCi0JCVBURV9ST1dfSEVJR0hUX0xJTkVBUiwgJnJxX3JlZ3MtPnJxX3JlZ3NfbC5w
dGVfcm93X2hlaWdodF9saW5lYXIpOwotCVJFR19HRVRfOChEQ0hVQlBfUkVRX1NJWkVfQ09ORklH
X0MsCi0JCUNIVU5LX1NJWkVfQywgJnJxX3JlZ3MtPnJxX3JlZ3NfYy5jaHVua19zaXplLAotCQlN
SU5fQ0hVTktfU0laRV9DLCAmcnFfcmVncy0+cnFfcmVnc19jLm1pbl9jaHVua19zaXplLAotCQlN
RVRBX0NIVU5LX1NJWkVfQywgJnJxX3JlZ3MtPnJxX3JlZ3NfYy5tZXRhX2NodW5rX3NpemUsCi0J
CU1JTl9NRVRBX0NIVU5LX1NJWkVfQywgJnJxX3JlZ3MtPnJxX3JlZ3NfYy5taW5fbWV0YV9jaHVu
a19zaXplLAotCQlEUFRFX0dST1VQX1NJWkVfQywgJnJxX3JlZ3MtPnJxX3JlZ3NfYy5kcHRlX2dy
b3VwX3NpemUsCi0JCU1QVEVfR1JPVVBfU0laRV9DLCAmcnFfcmVncy0+cnFfcmVnc19jLm1wdGVf
Z3JvdXBfc2l6ZSwKLQkJU1dBVEhfSEVJR0hUX0MsICZycV9yZWdzLT5ycV9yZWdzX2Muc3dhdGhf
aGVpZ2h0LAotCQlQVEVfUk9XX0hFSUdIVF9MSU5FQVJfQywgJnJxX3JlZ3MtPnJxX3JlZ3NfYy5w
dGVfcm93X2hlaWdodF9saW5lYXIpOwogCiAJLyogRExHIC0gUGVyIGh1YnAgKi8KIAlSRUdfR0VU
XzIoQkxBTktfT0ZGU0VUXzAsCkBAIC0xMDMwLDggKzEwMTIsMzggQEAgdm9pZCBodWJwMV9yZWFk
X3N0YXRlKHN0cnVjdCBodWJwICpodWJwKQogCVJFR19HRVRfMihEQ05fVFRVX1FPU19XTSwKIAkJ
CVFvU19MRVZFTF9MT1dfV00sICZzLT5xb3NfbGV2ZWxfbG93X3dtLAogCQkJUW9TX0xFVkVMX0hJ
R0hfV00sICZzLT5xb3NfbGV2ZWxfaGlnaF93bSk7CisKIH0KIAordm9pZCBodWJwMV9yZWFkX3N0
YXRlKHN0cnVjdCBodWJwICpodWJwKQoreworCXN0cnVjdCBkY24xMF9odWJwICpodWJwMSA9IFRP
X0RDTjEwX0hVQlAoaHVicCk7CisJc3RydWN0IGRjbl9odWJwX3N0YXRlICpzID0gJmh1YnAxLT5z
dGF0ZTsKKwlzdHJ1Y3QgX3Zjc19kcGlfZGlzcGxheV9ycV9yZWdzX3N0ICpycV9yZWdzID0gJnMt
PnJxX3JlZ3M7CisKKwlodWJwMV9yZWFkX3N0YXRlX2NvbW1vbihodWJwKTsKKworCVJFR19HRVRf
OChEQ0hVQlBfUkVRX1NJWkVfQ09ORklHLAorCQlDSFVOS19TSVpFLCAmcnFfcmVncy0+cnFfcmVn
c19sLmNodW5rX3NpemUsCisJCU1JTl9DSFVOS19TSVpFLCAmcnFfcmVncy0+cnFfcmVnc19sLm1p
bl9jaHVua19zaXplLAorCQlNRVRBX0NIVU5LX1NJWkUsICZycV9yZWdzLT5ycV9yZWdzX2wubWV0
YV9jaHVua19zaXplLAorCQlNSU5fTUVUQV9DSFVOS19TSVpFLCAmcnFfcmVncy0+cnFfcmVnc19s
Lm1pbl9tZXRhX2NodW5rX3NpemUsCisJCURQVEVfR1JPVVBfU0laRSwgJnJxX3JlZ3MtPnJxX3Jl
Z3NfbC5kcHRlX2dyb3VwX3NpemUsCisJCU1QVEVfR1JPVVBfU0laRSwgJnJxX3JlZ3MtPnJxX3Jl
Z3NfbC5tcHRlX2dyb3VwX3NpemUsCisJCVNXQVRIX0hFSUdIVCwgJnJxX3JlZ3MtPnJxX3JlZ3Nf
bC5zd2F0aF9oZWlnaHQsCisJCVBURV9ST1dfSEVJR0hUX0xJTkVBUiwgJnJxX3JlZ3MtPnJxX3Jl
Z3NfbC5wdGVfcm93X2hlaWdodF9saW5lYXIpOworCisJUkVHX0dFVF84KERDSFVCUF9SRVFfU0la
RV9DT05GSUdfQywKKwkJQ0hVTktfU0laRV9DLCAmcnFfcmVncy0+cnFfcmVnc19jLmNodW5rX3Np
emUsCisJCU1JTl9DSFVOS19TSVpFX0MsICZycV9yZWdzLT5ycV9yZWdzX2MubWluX2NodW5rX3Np
emUsCisJCU1FVEFfQ0hVTktfU0laRV9DLCAmcnFfcmVncy0+cnFfcmVnc19jLm1ldGFfY2h1bmtf
c2l6ZSwKKwkJTUlOX01FVEFfQ0hVTktfU0laRV9DLCAmcnFfcmVncy0+cnFfcmVnc19jLm1pbl9t
ZXRhX2NodW5rX3NpemUsCisJCURQVEVfR1JPVVBfU0laRV9DLCAmcnFfcmVncy0+cnFfcmVnc19j
LmRwdGVfZ3JvdXBfc2l6ZSwKKwkJTVBURV9HUk9VUF9TSVpFX0MsICZycV9yZWdzLT5ycV9yZWdz
X2MubXB0ZV9ncm91cF9zaXplLAorCQlTV0FUSF9IRUlHSFRfQywgJnJxX3JlZ3MtPnJxX3JlZ3Nf
Yy5zd2F0aF9oZWlnaHQsCisJCVBURV9ST1dfSEVJR0hUX0xJTkVBUl9DLCAmcnFfcmVncy0+cnFf
cmVnc19jLnB0ZV9yb3dfaGVpZ2h0X2xpbmVhcik7CisKK30KIGVudW0gY3Vyc29yX3BpdGNoIGh1
YnAxX2dldF9jdXJzb3JfcGl0Y2godW5zaWduZWQgaW50IHBpdGNoKQogewogCWVudW0gY3Vyc29y
X3BpdGNoIGh3X3BpdGNoOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjEwL2RjbjEwX2h1YnAuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24xMC9kY24xMF9odWJwLmgKaW5kZXggMzFjOGZkZDMyMDZjLi44ZjRiY2RjNzQxMTYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9odWJwLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h1YnAuaApA
QCAtMjQ5LDcgKzI0OSw4IEBACiAJLmZpZWxkX25hbWUgPSByZWdfbmFtZSAjIyBfXyAjIyBmaWVs
ZF9uYW1lICMjIHBvc3RfZml4CiAKIC8qIE1hc2svc2hpZnQgc3RydWN0IGdlbmVyYXRpb24gbWFj
cm8gZm9yIGFsbCBBU0lDcyAoaW5jbHVkaW5nIHRob3NlIHdpdGggcmVkdWNlZCBmdW5jdGlvbmFs
aXR5KSAqLwotI2RlZmluZSBIVUJQX01BU0tfU0hfTElTVF9EQ05fQ09NTU9OKG1hc2tfc2gpXAor
LyoxLngsIDIueCwgYW5kIDMueCovCisjZGVmaW5lIEhVQlBfTUFTS19TSF9MSVNUX0RDTl9TSEFS
RV9DT01NT04obWFza19zaClcCiAJSFVCUF9TRihIVUJQMF9EQ0hVQlBfQ05UTCwgSFVCUF9CTEFO
S19FTiwgbWFza19zaCksXAogCUhVQlBfU0YoSFVCUDBfRENIVUJQX0NOVEwsIEhVQlBfVFRVX0RJ
U0FCTEUsIG1hc2tfc2gpLFwKIAlIVUJQX1NGKEhVQlAwX0RDSFVCUF9DTlRMLCBIVUJQX1VOREVS
RkxPV19TVEFUVVMsIG1hc2tfc2gpLFwKQEAgLTI2NSw3ICsyNjYsNiBAQAogCUhVQlBfU0YoSFVC
UDBfRENTVVJGX0FERFJfQ09ORklHLCBNQVhfQ09NUFJFU1NFRF9GUkFHUywgbWFza19zaCksXAog
CUhVQlBfU0YoSFVCUDBfRENTVVJGX1RJTElOR19DT05GSUcsIFNXX01PREUsIG1hc2tfc2gpLFwK
IAlIVUJQX1NGKEhVQlAwX0RDU1VSRl9USUxJTkdfQ09ORklHLCBNRVRBX0xJTkVBUiwgbWFza19z
aCksXAotCUhVQlBfU0YoSFVCUDBfRENTVVJGX1RJTElOR19DT05GSUcsIFJCX0FMSUdORUQsIG1h
c2tfc2gpLFwKIAlIVUJQX1NGKEhVQlAwX0RDU1VSRl9USUxJTkdfQ09ORklHLCBQSVBFX0FMSUdO
RUQsIG1hc2tfc2gpLFwKIAlIVUJQX1NGKEhVQlBSRVEwX0RDU1VSRl9TVVJGQUNFX1BJVENILCBQ
SVRDSCwgbWFza19zaCksXAogCUhVQlBfU0YoSFVCUFJFUTBfRENTVVJGX1NVUkZBQ0VfUElUQ0gs
IE1FVEFfUElUQ0gsIG1hc2tfc2gpLFwKQEAgLTM3MiwxMiArMzcyLDE3IEBACiAJSFVCUF9TRihI
VUJQUkVRMF9EQ05fU1VSRjBfVFRVX0NOVEwwLCBRb1NfUkFNUF9ESVNBQkxFLCBtYXNrX3NoKSxc
CiAJSFVCUF9TRihIVUJQUkVRMF9EQ05fU1VSRjBfVFRVX0NOVEwxLCBSRUZDWUNfUEVSX1JFUV9E
RUxJVkVSWV9QUkUsIG1hc2tfc2gpLFwKIAlIVUJQX1NGKEhVQlAwX0hVQlBfQ0xLX0NOVEwsIEhV
QlBfQ0xPQ0tfRU5BQkxFLCBtYXNrX3NoKQotCi0jZGVmaW5lIEhVQlBfTUFTS19TSF9MSVNUX0RD
TihtYXNrX3NoKVwKLQlIVUJQX01BU0tfU0hfTElTVF9EQ05fQ09NTU9OKG1hc2tfc2gpLFwKKy8q
Mi54IGFuZCAxLnggb25seSovCisjZGVmaW5lIEhVQlBfTUFTS19TSF9MSVNUX0RDTl9DT01NT04o
bWFza19zaClcCisJSFVCUF9NQVNLX1NIX0xJU1RfRENOX1NIQVJFX0NPTU1PTihtYXNrX3NoKSxc
CisJSFVCUF9TRihIVUJQMF9EQ1NVUkZfVElMSU5HX0NPTkZJRywgUkJfQUxJR05FRCwgbWFza19z
aCksXAogCUhVQlBfU0YoSFVCUDBfRENIVUJQX1JFUV9TSVpFX0NPTkZJRywgTVBURV9HUk9VUF9T
SVpFLCBtYXNrX3NoKSxcCiAJSFVCUF9TRihIVUJQMF9EQ0hVQlBfUkVRX1NJWkVfQ09ORklHX0Ms
IE1QVEVfR1JPVVBfU0laRV9DLCBtYXNrX3NoKQogCisvKjIueCBhbmQgMS54IG9ubHkqLworI2Rl
ZmluZSBIVUJQX01BU0tfU0hfTElTVF9EQ04obWFza19zaClcCisJSFVCUF9NQVNLX1NIX0xJU1Rf
RENOX0NPTU1PTihtYXNrX3NoKQorCiAvKiBNYXNrL3NoaWZ0IHN0cnVjdCBnZW5lcmF0aW9uIG1h
Y3JvIGZvciBBU0lDcyB3aXRoIFZNICovCiAjZGVmaW5lIEhVQlBfTUFTS19TSF9MSVNUX0RDTl9W
TShtYXNrX3NoKVwKIAlIVUJQX1NGKEhVQlBSRVEwX05PTV9QQVJBTUVURVJTXzAsIERTVF9ZX1BF
Ul9QVEVfUk9XX05PTV9MLCBtYXNrX3NoKSxcCkBAIC00MzQsNyArNDM5LDcgQEAKIAlIVUJQX1NG
KENVUlNPUjBfQ1VSU09SX0hPVF9TUE9ULCBDVVJTT1JfSE9UX1NQT1RfWSwgbWFza19zaCksIFwK
IAlIVUJQX1NGKENVUlNPUjBfQ1VSU09SX0RTVF9PRkZTRVQsIENVUlNPUl9EU1RfWF9PRkZTRVQs
IG1hc2tfc2gpCiAKLSNkZWZpbmUgRENOX0hVQlBfUkVHX0ZJRUxEX0xJU1QodHlwZSkgXAorI2Rl
ZmluZSBEQ05fSFVCUF9SRUdfRklFTERfQkFTRV9MSVNUKHR5cGUpIFwKIAl0eXBlIEhVQlBfQkxB
TktfRU47XAogCXR5cGUgSFVCUF9ESVNBQkxFO1wKIAl0eXBlIEhVQlBfVFRVX0RJU0FCTEU7XApA
QCAtNDU5LDcgKzQ2NCw2IEBACiAJdHlwZSBST1RBVElPTl9BTkdMRTtcCiAJdHlwZSBIX01JUlJP
Ul9FTjtcCiAJdHlwZSBTVVJGQUNFX1BJWEVMX0ZPUk1BVDtcCi0JdHlwZSBBTFBIQV9QTEFORV9F
TjtcCiAJdHlwZSBTVVJGQUNFX0ZMSVBfVFlQRTtcCiAJdHlwZSBTVVJGQUNFX0ZMSVBfTU9ERV9G
T1JfU1RFUkVPU1lOQztcCiAJdHlwZSBTVVJGQUNFX0ZMSVBfSU5fU1RFUkVPU1lOQztcCkBAIC02
MzIsNiArNjM2LDEwIEBACiAJdHlwZSBDVVJTT1JfRFNUX1hfT0ZGU0VUOyBcCiAJdHlwZSBPVVRQ
VVRfRlAKIAorI2RlZmluZSBEQ05fSFVCUF9SRUdfRklFTERfTElTVCh0eXBlKSBcCisJRENOX0hV
QlBfUkVHX0ZJRUxEX0JBU0VfTElTVCh0eXBlKTtcCisJdHlwZSBBTFBIQV9QTEFORV9FTgorCiBz
dHJ1Y3QgZGNuX21pX3JlZ2lzdGVycyB7CiAJSFVCUF9DT01NT05fUkVHX1ZBUklBQkxFX0xJU1Q7
CiB9OwpAQCAtNzYwLDUgKzc2OCw2IEBAIHZvaWQgaHVicDFfdnJlYWR5X3dvcmthcm91bmQoc3Ry
dWN0IGh1YnAgKmh1YnAsCiAJCXN0cnVjdCBfdmNzX2RwaV9kaXNwbGF5X3BpcGVfZGVzdF9wYXJh
bXNfc3QgKnBpcGVfZGVzdCk7CiAKIHZvaWQgaHVicDFfaW5pdChzdHJ1Y3QgaHVicCAqaHVicCk7
Cit2b2lkIGh1YnAxX3JlYWRfc3RhdGVfY29tbW9uKHN0cnVjdCBodWJwICpodWJwKTsKIAogI2Vu
ZGlmCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNu
MjBfaHVicC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1
YnAuaAppbmRleCBkNWFjYzM0OGJlMjIuLjJjNjQwNWE2MmZjMSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YnAuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHVicC5oCkBAIC03Miw4ICs3Miw4
IEBACiAJU1IoRENOX1ZNX1NZU1RFTV9BUEVSVFVSRV9ERUZBVUxUX0FERFJfTVNCKSxcCiAJU1Io
RENOX1ZNX1NZU1RFTV9BUEVSVFVSRV9ERUZBVUxUX0FERFJfTFNCKQogCi0jZGVmaW5lIEhVQlBf
TUFTS19TSF9MSVNUX0RDTjJfQ09NTU9OKG1hc2tfc2gpXAotCUhVQlBfTUFTS19TSF9MSVNUX0RD
TihtYXNrX3NoKSxcCisjZGVmaW5lIEhVQlBfTUFTS19TSF9MSVNUX0RDTjJfU0hBUkVfQ09NTU9O
KG1hc2tfc2gpXAorCUhVQlBfTUFTS19TSF9MSVNUX0RDTl9TSEFSRV9DT01NT04obWFza19zaCks
XAogCUhVQlBfTUFTS19TSF9MSVNUX0RDTl9WTShtYXNrX3NoKSxcCiAJSFVCUF9TRihIVUJQMF9E
Q1NVUkZfU1VSRkFDRV9DT05GSUcsIFJPVEFUSU9OX0FOR0xFLCBtYXNrX3NoKSxcCiAJSFVCUF9T
RihIVUJQMF9EQ1NVUkZfU1VSRkFDRV9DT05GSUcsIEhfTUlSUk9SX0VOLCBtYXNrX3NoKSxcCkBA
IC0xMjcsMTMgKzEyNywyMSBAQAogCUhVQlBfU0YoSFVCUFJFUTBfRENTVVJGX0ZMSVBfQ09OVFJP
TDIsIFNVUkZBQ0VfVFJJUExFX0JVRkZFUl9FTkFCTEUsIG1hc2tfc2gpLFwKIAlIVUJQX1NGKEhV
QlBSRVEwX1ZNSURfU0VUVElOR1NfMCwgVk1JRCwgbWFza19zaCkKIAorLypEQ04yLnggYW5kIERD
TjEueCovCisjZGVmaW5lIEhVQlBfTUFTS19TSF9MSVNUX0RDTjJfQ09NTU9OKG1hc2tfc2gpXAor
CUhVQlBfTUFTS19TSF9MSVNUX0RDTjJfU0hBUkVfQ09NTU9OKG1hc2tfc2gpLFwKKwlIVUJQX1NG
KEhVQlAwX0RDU1VSRl9USUxJTkdfQ09ORklHLCBSQl9BTElHTkVELCBtYXNrX3NoKSxcCisJSFVC
UF9TRihIVUJQMF9EQ0hVQlBfUkVRX1NJWkVfQ09ORklHLCBNUFRFX0dST1VQX1NJWkUsIG1hc2tf
c2gpLFwKKwlIVUJQX1NGKEhVQlAwX0RDSFVCUF9SRVFfU0laRV9DT05GSUdfQywgTVBURV9HUk9V
UF9TSVpFX0MsIG1hc2tfc2gpCisKKy8qRENOMi4wIHNwZWNpZmljKi8KICNkZWZpbmUgSFVCUF9N
QVNLX1NIX0xJU1RfRENOMjAobWFza19zaClcCiAJSFVCUF9NQVNLX1NIX0xJU1RfRENOMl9DT01N
T04obWFza19zaCksXAogCUhVQlBfU0YoRENOX1ZNX1NZU1RFTV9BUEVSVFVSRV9ERUZBVUxUX0FE
RFJfTVNCLCBEQ05fVk1fU1lTVEVNX0FQRVJUVVJFX0RFRkFVTFRfU1lTVEVNLCBtYXNrX3NoKSxc
CiAJSFVCUF9TRihEQ05fVk1fU1lTVEVNX0FQRVJUVVJFX0RFRkFVTFRfQUREUl9NU0IsIERDTl9W
TV9TWVNURU1fQVBFUlRVUkVfREVGQVVMVF9BRERSX01TQiwgbWFza19zaCksXAogCUhVQlBfU0Yo
RENOX1ZNX1NZU1RFTV9BUEVSVFVSRV9ERUZBVUxUX0FERFJfTFNCLCBEQ05fVk1fU1lTVEVNX0FQ
RVJUVVJFX0RFRkFVTFRfQUREUl9MU0IsIG1hc2tfc2gpCiAKLQorLypEQ04yLnggKi8KICNkZWZp
bmUgRENOMl9IVUJQX1JFR19DT01NT05fVkFSSUFCTEVfTElTVCBcCiAJSFVCUF9DT01NT05fUkVH
X1ZBUklBQkxFX0xJU1Q7IFwKIAl1aW50MzJfdCBETURBVEFfQUREUkVTU19ISUdIOyBcCkBAIC0x
NDksMTQgKzE1NywxMSBAQAogCXVpbnQzMl90IEZMSVBfUEFSQU1FVEVSU18yO1wKIAl1aW50MzJf
dCBEQ05fQ1VSMV9UVFVfQ05UTDA7XAogCXVpbnQzMl90IERDTl9DVVIxX1RUVV9DTlRMMTtcCi0J
dWludDMyX3QgVk1JRF9TRVRUSU5HU18wO1wKLQl1aW50MzJfdCBGTElQX1BBUkFNRVRFUlNfMztc
Ci0JdWludDMyX3QgRkxJUF9QQVJBTUVURVJTXzQ7XAotCXVpbnQzMl90IFZCTEFOS19QQVJBTUVU
RVJTXzU7XAotCXVpbnQzMl90IFZCTEFOS19QQVJBTUVURVJTXzYKKwl1aW50MzJfdCBWTUlEX1NF
VFRJTkdTXzAKKwogCiAjZGVmaW5lIERDTjJfSFVCUF9SRUdfRklFTERfVkFSSUFCTEVfTElTVCh0
eXBlKSBcCi0JRENOX0hVQlBfUkVHX0ZJRUxEX0xJU1QodHlwZSk7IFwKKwlEQ05fSFVCUF9SRUdf
RklFTERfQkFTRV9MSVNUKHR5cGUpOyBcCiAJdHlwZSBETURBVEFfQUREUkVTU19ISUdIO1wKIAl0
eXBlIERNREFUQV9NT0RFO1wKIAl0eXBlIERNREFUQV9VUERBVEVEO1wKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKaW5kZXggOGQzYmMx
NTZkZTZmLi5mODIwZTk2NjdlM2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCkBAIC0xMTUsNyArMTE1LDcgQEAgc3RhdGljIHZv
aWQgZW5hYmxlX3Bvd2VyX2dhdGluZ19wbGFuZSgKIAlSRUdfVVBEQVRFKERPTUFJTjIxX1BHX0NP
TkZJRywgRE9NQUlOMjFfUE9XRVJfRk9SQ0VPTiwgZm9yY2Vfb24pOwogfQogCi1zdGF0aWMgdm9p
ZCBkY24yMF9kY2NnX2luaXQoc3RydWN0IGRjZV9od3NlcSAqaHdzKQordm9pZCBkY24yMF9kY2Nn
X2luaXQoc3RydWN0IGRjZV9od3NlcSAqaHdzKQogewogCS8qCiAJICogc2V0IE1JQ1JPU0VDT05E
X1RJTUVfQkFTRV9ESVYKQEAgLTEzOCw2ICsxMzgsNDUgQEAgc3RhdGljIHZvaWQgZGNuMjBfZGNj
Z19pbml0KHN0cnVjdCBkY2VfaHdzZXEgKmh3cykKIAkvKiBUaGlzIHZhbHVlIGlzIGRlcGVuZGVu
dCBvbiB0aGUgaGFyZHdhcmUgcGlwZWxpbmUgZGVsYXkgc28gc2V0IG9uY2UgcGVyIFNPQyAqLwog
CVJFR19XUklURShESVNQQ0xLX0ZSRVFfQ0hBTkdFX0NOVEwsIDB4ODAxMDAzYyk7CiB9Cit2b2lk
IGRjbjIwX2Rpc3BsYXlfaW5pdChzdHJ1Y3QgZGMgKmRjKQoreworCXN0cnVjdCBkY2VfaHdzZXEg
Kmh3cyA9IGRjLT5od3NlcTsKKworCS8qIFJCQk1JRgorCSAqIGRpc2FibGUgUkJCTUlGIHRpbWVv
dXQgZGV0ZWN0aW9uIGZvciBhbGwgY2xpZW50cworCSAqIEVuc3VyZSBSQkJNSUYgZG9lcyBub3Qg
ZHJvcCByZWdpc3RlciBhY2Nlc3NlcyBkdWUgdG8gdGhlIHBlci1jbGllbnQgdGltZW91dAorCSAq
LworCVJFR19XUklURShSQkJNSUZfVElNRU9VVF9ESVMsIDB4RkZGRkZGRkYpOworCVJFR19XUklU
RShSQkJNSUZfVElNRU9VVF9ESVNfMiwgMHhGRkZGRkZGRik7CisKKwkvKiBEQ0NHICovCisJZGNu
MjBfZGNjZ19pbml0KGh3cyk7CisKKwkvKiBEaXNhYmxlIGFsbCBtZW1vcnkgbG93IHBvd2VyIG1v
ZGUuIEFsbCBtZW1vcmllcyBhcmUgZW5hYmxlZC4gKi8KKwlSRUdfVVBEQVRFKERDX01FTV9HTE9C
QUxfUFdSX1JFUV9DTlRMLCBEQ19NRU1fR0xPQkFMX1BXUl9SRVFfRElTLCAxKTsKKworCS8qIERD
SFVCL01NSFVCQlVCCisJICogc2V0IGdsb2JhbCB0aW1lciByZWZjbGsgZGl2aWRlcgorCSAqIDEw
ME1oeiByZWZjbGsgLT4gMgorCSAqIDI3TWh6IHJlZmNsayAtPiAgMQorCSAqIDQ4TWh6IHJlZmNs
ayAtPiAgMQorCSAqLworCVJFR19VUERBVEUoRENIVUJCVUJfR0xPQkFMX1RJTUVSX0NOVEwsIERD
SFVCQlVCX0dMT0JBTF9USU1FUl9SRUZESVYsIDIpOworCVJFR19VUERBVEUoRENIVUJCVUJfR0xP
QkFMX1RJTUVSX0NOVEwsIERDSFVCQlVCX0dMT0JBTF9USU1FUl9FTkFCTEUsIDEpOworCVJFR19X
UklURShSRUZDTEtfQ05UTCwgMCk7CisKKwkvKiBPUFRDCisJICogT1RHX0NPTlRST0wuT1RHX0RJ
U0FCTEVfUE9JTlRfQ05UTCA9IDB4Mzsgd2lsbCBiZSBzZXQgZHVyaW5nIG9wdGMyX2VuYWJsZV9j
cnRjCisJICovCisKKwkvKiBBWgorCSAqIGRlZmF1bHQgdmFsdWUgaXMgMHg2NCBmb3IgMTAwTWh6
IHJlZiBjbG9jaywgaWYgdGhlIHJlZiBjbG9jayBpcyAxMDBNaHosIG5vIG5lZWQgdG8gcHJvZ3Jh
bSB0aGlzIHJlZ2lzZXIsCisJICogaWYgbm90LCBpdCBzaG91bGQgYmUgcHJvZ3JhbW1lZCBhY2Nv
cmRpbmcgdG8gdGhlIHJlZiBjbG9jaworCSAqLworCVJFR19VUERBVEUoQVpBTElBX0FVRElPX0RU
TywgQVpBTElBX0FVRElPX0RUT19NT0RVTEUsIDB4NjQpOworCS8qIEVuYWJsZSBjb250cm9sbGVy
IGNsb2NrIGdhdGluZyAqLworCVJFR19XUklURShBWkFMSUFfQ09OVFJPTExFUl9DTE9DS19HQVRJ
TkcsIDB4MSk7Cit9CiAKIHN0YXRpYyB2b2lkIGRpc2FibGVfdmdhKAogCXN0cnVjdCBkY2VfaHdz
ZXEgKmh3cykKQEAgLTE2Myw3ICsyMDIsNyBAQCB2b2lkIGRjbjIwX3Byb2dyYW1fdHJpcGxlQnVm
ZmVyKAogfQogCiAvKiBCbGFuayBwaXhlbCBkYXRhIGR1cmluZyBpbml0aWFsaXphdGlvbiAqLwot
c3RhdGljIHZvaWQgZGNuMjBfaW5pdF9ibGFuaygKK3ZvaWQgZGNuMjBfaW5pdF9ibGFuaygKIAkJ
c3RydWN0IGRjICpkYywKIAkJc3RydWN0IHRpbWluZ19nZW5lcmF0b3IgKnRnKQogewpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmgg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuaAppbmRl
eCAyYjA0MDk0NTQwNzMuLjY4OWMyNzY1YjA3MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmgKQEAgLTkxLDEzICs5MSw5IEBAIHZv
aWQgZGNuMjBfcGlwZV9jb250cm9sX2xvY2tfZ2xvYmFsKAogdm9pZCBkY24yMF9zZXR1cF9nc2xf
Z3JvdXBfYXNfbG9jayhjb25zdCBzdHJ1Y3QgZGMgKmRjLAogCQkJCXN0cnVjdCBwaXBlX2N0eCAq
cGlwZV9jdHgsCiAJCQkJYm9vbCBlbmFibGUpOwotdm9pZCBkY24yMF9waXBlX2NvbnRyb2xfbG9j
aygKLQlzdHJ1Y3QgZGMgKmRjLAotCXN0cnVjdCBwaXBlX2N0eCAqcGlwZSwKLQlib29sIGxvY2sp
Owotdm9pZCBkY24yMF9kaXNhYmxlX3BsYW5lKHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBwaXBlX2N0
eCAqcGlwZV9jdHgpOwotdm9pZCBkY24yMF9lbmFibGVfcGxhbmUoCi0Jc3RydWN0IGRjICpkYywK
LQlzdHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4LAotCXN0cnVjdCBkY19zdGF0ZSAqY29udGV4dCk7
Cit2b2lkIGRjbjIwX2RjY2dfaW5pdChzdHJ1Y3QgZGNlX2h3c2VxICpod3MpOwordm9pZCBkY24y
MF9pbml0X2JsYW5rKAorCSAgIHN0cnVjdCBkYyAqZGMsCisJICAgc3RydWN0IHRpbWluZ19nZW5l
cmF0b3IgKnRnKTsKK3ZvaWQgZGNuMjBfZGlzcGxheV9pbml0KHN0cnVjdCBkYyAqZGMpOwogI2Vu
ZGlmIC8qIF9fRENfSFdTU19EQ04yMF9IX18gKi8KLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
