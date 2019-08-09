Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F09884F3
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8BC6EEB3;
	Fri,  9 Aug 2019 21:38:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710051.outbound.protection.outlook.com [40.107.71.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAEB6EEB0
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nb7J7SccONDwnzOfY/oIeqBke/NB3Ql+b2Pm+0ZW6sGNdo+010X2pYtnupEsc5stkfk6vaxsOCUkBB6xepGUYILUJ3rN7TYqy7CVye0voT702twCXV2ZDY91Ypyaw7kNOMh8VmQ5nuMEmOnZk4nTxgWrCj3naO+MMlmr6ktAJXGU7xUsojPyhVLZyQGCMtc0RkM06UTISFngRKpD0k0Ko5cX4CmjlzEijmjVp5NYkVGnoKzkkHWhOEuZXuKZViAzS4+4qv3tB7msKvvbge5pKRISHKgQX9QhgzOdKa3Lm6pm6cF5/BMMsh4SqNEq5HoD1uYRRD/eDqNQE3n/vx5mwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANqs5W2jG+jEwD4a/qg+syAXe0U5w8K6y227tmzVWbg=;
 b=H/ZbUlcnBR/r+3Pl3AdQNmbIEhQPlkj4a7bZqOcDs5hsrBClMRmKVaJ2XXa9ZwR08N5X0LZvZ+QA2dA02jsoVMKkqQ409behmzGWUtjl2wzrUf3tHO7vjepSBpyu1QugJc3Fyn9q5Q8NFSgcVgP6nuiJbGHKssWEsoBdfSgLItUk3krqUuYUyRXcSjUBb3jjfqQqw2mz8NrKd6cRxVZNcYrwExWgCIccpd0AmiJazsoOZw4RA29Pzf+C1Ta/VhcuS6DhH80jsBn16+6jsgxk0IPW6xB1t9Kc0aqbibq3Yqj2F9BP9glIM3ef+7ltXSk0ekLKik2X19wFZOHMTsbttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=amdcloud.onmicrosoft.com
 smtp.mailfrom=amd.com; dmarc=permerror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
Received: from CY4PR1201CA0019.namprd12.prod.outlook.com
 (2603:10b6:910:16::29) by MN2PR12MB3343.namprd12.prod.outlook.com
 (2603:10b6:208:c2::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14; Fri, 9 Aug
 2019 21:38:29 +0000
Received: from DM3NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by CY4PR1201CA0019.outlook.office365.com
 (2603:10b6:910:16::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.16 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT040.mail.protection.outlook.com (10.152.83.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:28 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:20 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 12/49] drm/amd/display: Add work-around option to skip DCN20
 clock updates
Date: Fri, 9 Aug 2019 17:37:05 -0400
Message-ID: <20190809213742.30301-13-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(376002)(136003)(2980300002)(428003)(199004)(189003)(51416003)(70586007)(36756003)(76176011)(50226002)(1076003)(70206006)(6916009)(476003)(316002)(26005)(54906003)(14444005)(305945005)(186003)(48376002)(53936002)(5660300002)(426003)(50466002)(86362001)(2876002)(336012)(486006)(8936002)(81156014)(47776003)(81166006)(478600001)(8676002)(4326008)(49486002)(2351001)(2870700001)(126002)(11346002)(6666004)(356004)(2906002)(2616005)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3343; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: deb49ab6-3047-4cf0-caba-08d71d11eae5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3343; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3343:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3343BB513A5745426279603C82D60@MN2PR12MB3343.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Du98cZYIDmGZ6WykzJp+u0qNo+/uERmaG5baBEimxdEIS3AIRsdZdeQmtrm+Mus22ycDZ1SvbrNN3tw9jOClHrQwbUbpp0Wwe4zW7TLmflIx1Q+NOz00uKvnGAfT1tPHWUR9tv6blX+Sp5dDntqUMpFAXLZEqWjla5fL1rHi0WMjBaBHxk34whF7wGESRiSFAJoaYMHMZJkRQC9i7RY7KIW4RmQUw8AEnkZIRxqynKDZuc3tCmQ0mJzluOAW+PYidx8K3Vrv1hx9GeR7Ej4jhtMDSdw95dNq5A+EAg/yQCQZHylJk9fIb79wx9bOLjYW0wx5Vk80dJzTnAalFnhWhcAkR6p2K4qDVTGykiA+TNx+ql6ip71XyQqinQ1Iq1lz9ys6rluH5ErnZmim03T+O1U16b+a0lo8z3WDDJ61q/Q=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:28.7140 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deb49ab6-3047-4cf0-caba-08d71d11eae5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3343
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANqs5W2jG+jEwD4a/qg+syAXe0U5w8K6y227tmzVWbg=;
 b=hjKrvt5US6FuEObSkBHc7+l4Mr/HbtRovc8n1MVFYQpGDsQLqa8KwujpXVRjWlNLxDmgZudSU7ZJl2pTmgsAzDn/DueTWzDg7CQlE9pIDKBlzkpGz5VRL+eB4FZngajxEPV23nXtnBMO5VItKtXs9srbA3vqKTP/n91Zg9PJy9k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; amdcloud.onmicrosoft.com; dkim=none (message not
 signed) header.d=none;amdcloud.onmicrosoft.com; dmarc=permerror action=none
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
Cc: Leo Li <sunpeng.li@amd.com>, Jaehyun Chung <jaehyun.chung@amd.com>,
 Alvin Lee <Alvin.Lee2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFlaHl1biBDaHVuZyA8amFlaHl1bi5jaHVuZ0BhbWQuY29tPgoKW1doeV0gQXV0byBP
dmVyY2xvY2sgTWVtb3J5IGZhaWxzIGZvciBzb21lIHN5c3RlbXMgdGhhdCBkb24ndCBzdXBwb3J0
CnAtc3RhdGUuCgpbSG93XSBJbXBsZW1lbnQgdGhlIHdvcmthcm91bmQsIGFuZCBpdCdzIGNvcnJl
c3BvbmRpbmcgZW5hYmxlIGZsYWcuCgpTaWduZWQtb2ZmLWJ5OiBKYWVoeXVuIENodW5nIDxqYWVo
eXVuLmNodW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbHZpbiBMZWUgPEFsdmluLkxlZTJAYW1k
LmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3IuYyB8IDMg
KysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBf
Y2xrX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAv
ZGNuMjBfY2xrX21nci5jCmluZGV4IDI0Nzc1YWI4MTIxNi4uM2U4YWMzMDNiZDUyIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMC9kY24yMF9j
bGtfbWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNu
MjAvZGNuMjBfY2xrX21nci5jCkBAIC0xOTgsNiArMTk4LDkgQEAgdm9pZCBkY24yX3VwZGF0ZV9j
bG9ja3Moc3RydWN0IGNsa19tZ3IgKmNsa19tZ3JfYmFzZSwKIAlib29sIGZvcmNlX3Jlc2V0ID0g
ZmFsc2U7CiAJaW50IGk7CiAKKwlpZiAoZGMtPndvcmtfYXJvdW5kcy5za2lwX2Nsb2NrX3VwZGF0
ZSkKKwkJcmV0dXJuOworCiAJaWYgKGNsa19tZ3JfYmFzZS0+Y2xrcy5kaXNwY2xrX2toeiA9PSAw
IHx8CiAJCWRjLT5kZWJ1Zy5mb3JjZV9jbG9ja19tb2RlICYgMHgxKSB7CiAJCS8vdGhpcyBpcyBm
cm9tIHJlc3VtZSBvciBib290IHVwLCBpZiBmb3JjZWRfY2xvY2sgY2ZnIG9wdGlvbiB1c2VkLCB3
ZSBieXBhc3MgcHJvZ3JhbSBkaXNwY2xrIGFuZCBEUFBDTEssIGJ1dCBuZWVkIHNldCB0aGVtIGZv
ciBTMy4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKaW5kZXggZTNkNzcxMGI1YzU0Li4x
ODY2ZmE3MWE3NjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Yy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCkBAIC0xMjIsNiAr
MTIyLDcgQEAgc3RydWN0IGRjX2J1Z193YSB7CiAJYm9vbCBub19jb25uZWN0X3BoeV9jb25maWc7
CiAJYm9vbCBkZWRjbjIwXzMwNV93YTsKIAlzdHJ1Y3QgZGlzcGxheV9tb2RlX2xpYiBhbHRlcm5h
dGVfZG1sOworCWJvb2wgc2tpcF9jbG9ja191cGRhdGU7CiB9OwogI2VuZGlmCiAKLS0gCjIuMjIu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
