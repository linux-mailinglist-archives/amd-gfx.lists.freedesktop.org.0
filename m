Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 777F463964
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2019 18:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A34389870;
	Tue,  9 Jul 2019 16:30:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730082.outbound.protection.outlook.com [40.107.73.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06B289870
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2019 16:30:28 +0000 (UTC)
Received: from CH2PR12CA0023.namprd12.prod.outlook.com (2603:10b6:610:57::33)
 by MWHPR12MB1198.namprd12.prod.outlook.com (2603:10b6:300:d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Tue, 9 Jul
 2019 16:30:26 +0000
Received: from DM3NAM03FT036.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by CH2PR12CA0023.outlook.office365.com
 (2603:10b6:610:57::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Tue, 9 Jul 2019 16:30:26 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT036.mail.protection.outlook.com (10.152.82.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 9 Jul 2019 16:30:26 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 9 Jul 2019
 11:30:25 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/display: Expose audio inst from DC to DM
Date: Tue, 9 Jul 2019 12:30:18 -0400
Message-ID: <20190709163019.32085-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(2980300002)(428003)(189003)(199004)(48376002)(50226002)(6916009)(2351001)(70206006)(70586007)(478600001)(36756003)(68736007)(2906002)(5660300002)(486006)(44832011)(2616005)(476003)(126002)(47776003)(186003)(336012)(426003)(1076003)(305945005)(14444005)(53416004)(4326008)(77096007)(26005)(6666004)(356004)(86362001)(50466002)(72206003)(8936002)(51416003)(16586007)(316002)(7696005)(81166006)(81156014)(8676002)(54906003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1198; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79df93ab-6ed8-41fc-fc92-08d7048abf8f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1198; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1198:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1198F35219DE92655D7B89E1ECF10@MWHPR12MB1198.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0093C80C01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: zZzU7UctAVKSjZEG9LgyTWNRK5DfdTblbRSJHkMz8mi2Xmhz5BezG1PPrdagcFgDCAxxM6f9+shZO1zmIplBHEAe1kI4iID7pvSwGtYcQ/vJfK6EszhtPNt8XV3fts2pE0t0246Of8UzUb1Xm24KdOZDtD+Ali9CuE4aD7s/KZASQUYzt8C5CiaYn9e+dibtpuwJv4Ucgh/o1ZyzY9lmKOUU69ftMLcTVcDpL2CXr1jRHHEDt0Tgt2/OFra+w5qL0+8vbq7X3GwR4cWdZBS3GIhZZc8H2mOvLDijmJKLUN20cSMpr3gWP2jAGwQQZ6fb37bt1KHVAI2/2Bp+C1PqNMNbU0bTB+65o7qarXW2DTVynRvO1JRkUsuzuAqsRgUG/ReZXAEQc672Fmu35RbeER4CX8ndGzWQ4SGXFtVqNK8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2019 16:30:26.0285 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79df93ab-6ed8-41fc-fc92-08d7048abf8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1198
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXW39TCj4fVySEgFC6cdNQZhv7ojjNt5FbQH0Is+RwA=;
 b=FCY7x1kHxrXzzZTVWNHEEORduAoqECc/KlPib59X25g5DmaVr+/Cct4/ftwCTZxhfXCFch8Mr90pgySu36932BqB4ZnsBbsWPMKn3eiGVXZxPmNN177L2WmSEpMrW/lNTwZXGVwrOGx6hz7hiDIYLIuxTVYGpb+/DLTtFNZJY+s=
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
Cc: Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KSW4gb3JkZXIgdG8gZ2l2ZSBwaW4gbm90aWZpY2F0aW9ucyB0byB0aGUgc291bmQgZHJp
dmVyIGZyb20gRE0gd2UgbmVlZAp0byBrbm93IHdoZXRoZXIgYXVkaW8gaXMgZW5hYmxlZCBvbiBh
IHN0cmVhbSBhbmQgd2hhdCBwaW4gaXQncyB1c2luZwpmcm9tIERDLgoKW0hvd10KRXhwb3NlIHRo
ZSBpbnN0YW5jZSB2aWEgc3RyZWFtIHN0YXR1cyBpZiBpdCdzIGEgbWFwcGVkIHJlc291cmNlIGZv
cgp0aGUgc3RyZWFtLiBJdCB3aWxsIGJlIC0xIGlmIHRoZXJlJ3Mgbm8gYXVkaW8gbWFwcGVkLgoK
Q2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5
LndlbnRsYW5kQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5p
Y2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvY29yZS9kY19yZXNvdXJjZS5jIHwgMyArKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY19zdHJlYW0uaCAgICAgICAgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nv
cmUvZGNfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
X3Jlc291cmNlLmMKaW5kZXggZDEwZWJmZDMzYTYwLi41Yjg1MTM5ZmIzY2UgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYwpAQCAtMjAw
OCw2ICsyMDA4LDkgQEAgZW51bSBkY19zdGF0dXMgcmVzb3VyY2VfbWFwX3Bvb2xfcmVzb3VyY2Vz
KAogCQlpZiAoY29udGV4dC0+c3RyZWFtc1tpXSA9PSBzdHJlYW0pIHsKIAkJCWNvbnRleHQtPnN0
cmVhbV9zdGF0dXNbaV0ucHJpbWFyeV9vdGdfaW5zdCA9IHBpcGVfY3R4LT5zdHJlYW1fcmVzLnRn
LT5pbnN0OwogCQkJY29udGV4dC0+c3RyZWFtX3N0YXR1c1tpXS5zdHJlYW1fZW5jX2luc3QgPSBw
aXBlX2N0eC0+c3RyZWFtX3Jlcy5zdHJlYW1fZW5jLT5pZDsKKwkJCWNvbnRleHQtPnN0cmVhbV9z
dGF0dXNbaV0uYXVkaW9faW5zdCA9CisJCQkJcGlwZV9jdHgtPnN0cmVhbV9yZXMuYXVkaW8gPyBw
aXBlX2N0eC0+c3RyZWFtX3Jlcy5hdWRpby0+aW5zdCA6IC0xOworCiAJCQlyZXR1cm4gRENfT0s7
CiAJCX0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX3N0
cmVhbS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX3N0cmVhbS5oCmluZGV4
IGUyNTNhNWM1OTFmNi4uMGZhMWMyNmJjMjBkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNfc3RyZWFtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjX3N0cmVhbS5oCkBAIC00Miw2ICs0Miw3IEBAIHN0cnVjdCBkY19zdHJlYW1fc3Rh
dHVzIHsKIAlpbnQgcHJpbWFyeV9vdGdfaW5zdDsKIAlpbnQgc3RyZWFtX2VuY19pbnN0OwogCWlu
dCBwbGFuZV9jb3VudDsKKwlpbnQgYXVkaW9faW5zdDsKIAlzdHJ1Y3QgdGltaW5nX3N5bmNfaW5m
byB0aW1pbmdfc3luY19pbmZvOwogCXN0cnVjdCBkY19wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGVz
W01BWF9TVVJGQUNFX05VTV07CiB9OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
