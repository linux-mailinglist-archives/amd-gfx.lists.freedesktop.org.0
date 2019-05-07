Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE9915767
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 03:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879E289C53;
	Tue,  7 May 2019 01:47:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730070.outbound.protection.outlook.com [40.107.73.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B40189C53
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 01:47:27 +0000 (UTC)
Received: from SN1PR12CA0045.namprd12.prod.outlook.com (52.132.192.16) by
 CY4PR12MB1222.namprd12.prod.outlook.com (10.168.166.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Tue, 7 May 2019 01:47:26 +0000
Received: from CO1NAM03FT059.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by SN1PR12CA0045.outlook.office365.com
 (2603:10b6:802:20::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 7 May 2019 01:47:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT059.mail.protection.outlook.com (10.152.81.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 7 May 2019 01:47:25 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 6 May 2019
 20:47:23 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: treat negative lockup timeout as 'infinite
 timeout' V2
Date: Tue, 7 May 2019 09:47:15 +0800
Message-ID: <20190507014715.16505-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(376002)(39860400002)(136003)(346002)(2980300002)(428003)(199004)(189003)(426003)(47776003)(2616005)(2870700001)(126002)(476003)(486006)(2906002)(186003)(1076003)(50466002)(26005)(48376002)(77096007)(53416004)(7696005)(51416003)(72206003)(336012)(81156014)(50226002)(8936002)(4326008)(8676002)(5660300002)(53936002)(478600001)(70206006)(70586007)(54906003)(44832011)(81166006)(6916009)(305945005)(316002)(2351001)(36756003)(86362001)(68736007)(356004)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1222; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98d7d8b0-9be0-4b22-8286-08d6d28df491
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:CY4PR12MB1222; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1222:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1222500183C1727B558AF40DE4310@CY4PR12MB1222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0030839EEE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: KjLapHbeFaaYhccYAKB9+SPeSfm0JaijEsMmhu272My1KDKtkV+16hPB/dzdDq1MoMhg6yYVyrrqwC6B5zZG0azE01EKtoCT4X6VMzk0EH47PbyfXEM4S69k9YUmyN/O61xYDy/jQVAxwKh1dOkOhnj+xNz03BFSw1HnneMYnLMFv3upmtP07JLHnQUhzc43jv7O/bwAvEltoCqRM6DOPz8Mfx1bFr6sJ8cRgnKuVBNOiJDb7pAq4jvxGK74KDktdLJerglMyVSGmRROJlxOxibg584m13W3LnyLqcxrFX841Wfbb1P0gspry4hZljZMsR6t+uwzBqUVKMsIeWFa+zQ96fQwtCwFAdXtHakQGqsiXa3ib25bVGYHeJyBEsv2G1nSod6fptLkLG3NsLM3tF5I+PPjngIrcmocVxcA4Qw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2019 01:47:25.2761 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d7d8b0-9be0-4b22-8286-08d6d28df491
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1222
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eo4Wb4VsybOZEXrQO9UoYX2Bp2bvsvX1S2AvirLLo38=;
 b=Cz5nSor0F30Tu/pHhiQ/OBNrl/kkdNqeb1vhApwruR3ACL5phd8T8GgSCrkOuYWHY/BPoBGP3Fm1xbk2aTpRTMoST0sJoS3QVDlP9tFdzOOo7qvFlhUXTRSNHPXo84+bXIXhb6SZep0TupM7vDQ/ycW1t0zq9xI/Ga0Z8saE5xs=
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
Cc: Evan Quan <evan.quan@amd.com>, Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TmVnYXRpdmUgbG9ja3VwIHRpbWVvdXQgaXMgdmFsaWQgYW5kIHdpbGwgYmUgdHJlYXRlZCBhcwon
aW5maW5pdGUgdGltZW91dCcuCgotIFYyOiB1c2UgbXNlY3NfdG9famlmZmllcyBmb3IgbmVnYXRp
dmUgdmFsdWVzCgpDaGFuZ2UtSWQ6IEkwZDgzODc5NTZhOWM3NDQwNzNjMDI4MWVmMmUxYTU0N2Q0
ZjE2ZGVjClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMjAgKysrKysrKysrKysr
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwppbmRleCBjNWZiYTc5YzM2
NjAuLmJjZDU5YmEwN2JiMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYu
YwpAQCAtMjM3LDEzICsyMzcsMTQgQEAgbW9kdWxlX3BhcmFtX25hbWVkKG1zaSwgYW1kZ3B1X21z
aSwgaW50LCAwNDQ0KTsKICAqIFNldCBHUFUgc2NoZWR1bGVyIHRpbWVvdXQgdmFsdWUgaW4gbXMu
CiAgKgogICogVGhlIGZvcm1hdCBjYW4gYmUgW05vbi1Db21wdXRlXSBvciBbR0ZYLENvbXB1dGUs
U0RNQSxWaWRlb10uIFRoYXQgaXMgdGhlcmUgY2FuIGJlIG9uZSBvcgotICogbXVsdGlwbGUgdmFs
dWVzIHNwZWNpZmllZC4gMCBhbmQgbmVnYXRpdmUgdmFsdWVzIGFyZSBpbnZhbGlkYXRlZC4gVGhl
eSB3aWxsIGJlIGFkanVzdGVkCi0gKiB0byBkZWZhdWx0IHRpbWVvdXQuCisgKiBtdWx0aXBsZSB2
YWx1ZXMgc3BlY2lmaWVkLgogICogIC0gV2l0aCBvbmUgdmFsdWUgc3BlY2lmaWVkLCB0aGUgc2V0
dGluZyB3aWxsIGFwcGx5IHRvIGFsbCBub24tY29tcHV0ZSBqb2JzLgogICogIC0gV2l0aCBtdWx0
aXBsZSB2YWx1ZXMgc3BlY2lmaWVkLCB0aGUgZmlyc3Qgb25lIHdpbGwgYmUgZm9yIEdGWC4gVGhl
IHNlY29uZCBvbmUgaXMgZm9yIENvbXB1dGUuCiAgKiAgICBBbmQgdGhlIHRoaXJkIGFuZCBmb3Vy
dGggb25lcyBhcmUgZm9yIFNETUEgYW5kIFZpZGVvLgogICogQnkgZGVmYXVsdCh3aXRoIG5vIGxv
Y2t1cF90aW1lb3V0IHNldHRpbmdzKSwgdGhlIHRpbWVvdXQgZm9yIGFsbCBub24tY29tcHV0ZShH
RlgsIFNETUEgYW5kIFZpZGVvKQogICogam9icyBpcyAxMDAwMC4gQW5kIHRoZXJlIGlzIG5vIHRp
bWVvdXQgZW5mb3JjZWQgb24gY29tcHV0ZSBqb2JzLgorICogVmFsdWUgMCBpcyBpbnZhbGlkYXRl
ZCwgd2lsbCBiZSBhZGp1c3RlZCB0byBkZWZhdWx0IHRpbWVvdXQgc2V0dGluZ3MuCisgKiBOZWdh
dGl2ZSB2YWx1ZXMgbWVhbiAnaW5maW5pdGUgdGltZW91dCcgKE1BWF9KSUZGWV9PRkZTRVQpLgog
ICovCiBNT0RVTEVfUEFSTV9ERVNDKGxvY2t1cF90aW1lb3V0LCAiR1BVIGxvY2t1cCB0aW1lb3V0
IGluIG1zIChkZWZhdWx0OiAxMDAwMCBmb3Igbm9uLWNvbXB1dGUgam9icyBhbmQgbm8gdGltZW91
dCBmb3IgY29tcHV0ZSBqb2JzKSwgIgogCQkiZm9ybWF0IGlzIFtOb24tQ29tcHV0ZV0gb3IgW0dG
WCxDb21wdXRlLFNETUEsVmlkZW9dIik7CkBAIC0xMzM5LDI0ICsxMzQwLDI3IEBAIGludCBhbWRn
cHVfZGV2aWNlX2dldF9qb2JfdGltZW91dF9zZXR0aW5ncyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKIAkJCWlmIChyZXQpCiAJCQkJcmV0dXJuIHJldDsKIAotCQkJLyogSW52YWxpZGF0ZSAw
IGFuZCBuZWdhdGl2ZSB2YWx1ZXMgKi8KLQkJCWlmICh0aW1lb3V0IDw9IDApIHsKKwkJCS8qCisJ
CQkgKiBWYWx1ZSAwIHdpbGwgYmUgYWRqdXN0ZWQgdG8gZGVmYXVsdCB0aW1lb3V0IHNldHRpbmdz
LgorCQkJICogTmVnYXRpdmUgdmFsdWVzIG1lYW4gJ2luZmluaXRlIHRpbWVvdXQnIChNQVhfSklG
RllfT0ZGU0VUKS4KKwkJCSAqLworCQkJaWYgKCF0aW1lb3V0KSB7CiAJCQkJaW5kZXgrKzsKIAkJ
CQljb250aW51ZTsKIAkJCX0KIAogCQkJc3dpdGNoIChpbmRleCsrKSB7CiAJCQljYXNlIDA6Ci0J
CQkJYWRldi0+Z2Z4X3RpbWVvdXQgPSB0aW1lb3V0OworCQkJCWFkZXYtPmdmeF90aW1lb3V0ID0g
bXNlY3NfdG9famlmZmllcyh0aW1lb3V0KTsKIAkJCQlicmVhazsKIAkJCWNhc2UgMToKLQkJCQlh
ZGV2LT5jb21wdXRlX3RpbWVvdXQgPSB0aW1lb3V0OworCQkJCWFkZXYtPmNvbXB1dGVfdGltZW91
dCA9IG1zZWNzX3RvX2ppZmZpZXModGltZW91dCk7CiAJCQkJYnJlYWs7CiAJCQljYXNlIDI6Ci0J
CQkJYWRldi0+c2RtYV90aW1lb3V0ID0gdGltZW91dDsKKwkJCQlhZGV2LT5zZG1hX3RpbWVvdXQg
PSBtc2Vjc190b19qaWZmaWVzKHRpbWVvdXQpOwogCQkJCWJyZWFrOwogCQkJY2FzZSAzOgotCQkJ
CWFkZXYtPnZpZGVvX3RpbWVvdXQgPSB0aW1lb3V0OworCQkJCWFkZXYtPnZpZGVvX3RpbWVvdXQg
PSBtc2Vjc190b19qaWZmaWVzKHRpbWVvdXQpOwogCQkJCWJyZWFrOwogCQkJZGVmYXVsdDoKIAkJ
CQlicmVhazsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
