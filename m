Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1859869DBA
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155F389C46;
	Mon, 15 Jul 2019 21:21:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780045.outbound.protection.outlook.com [40.107.78.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D98889C68
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsJSjl3CO6C/CzeKDZoVO84gus5fKDQnhLEF/nr5XjAzIvxsNwJfwi/l/K3CVst932vUhwoxVHKkeMKsqwEE+HxcjVEajnQV6YlK6Osha0jlurNZxQWqWQXl3z0nrML5lJapm99qk5quadt21a53StYbCwUNRfHDj7GjxMQT5ioqkPEi5wYGzHWa34t7Y10eUwT5FKrHwUgcxnys+b4nMh+OjNy/d0qhwh7v/aR3MrBNTdm9qFDvjaVaVJl1PNF2mg8UFD16GkaVBk5c8tyff0UrZcZFb8p/VwYx5CRJAJTpIsSNHksIbNuI0aI/qZGd9yRAahHQbE2cJp6bwqlr3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B820o1lola00WtsTU2YhTibd2lbLcXBs5KJ6GdKRYsE=;
 b=INIHmvCoe3Azq1DJCfCp0m0/4RNj02Zz1jrAAH4Kvs1GZi952jl6Ouy9ggPvUjBXzHLT2fNnuAYgkm+hGCoMdlZ9JFZbodCV2CbZ6vxsxt/Rmo31DpOLX3xrqxWst43jyzD1dRG3Eh9scG3RBDE94J5x1WYdYWdVk2Q02Dd7xauejHAQyjHif3n0g/EZmgX3sio8Eb7bCRPTMhnHXcXk3Onv09seuCgh7MevTQAuFgW0oAe1h6T0yfaAroxPt80wkjYCddHrFy3ngLCmKFPqh/ObXdr57eeU6ZQrqa5HDeA+guBNf0Gs5RQbVLn8N6kfOuteMaMHJx584rELNNdIUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 CH2PR12MB3928.namprd12.prod.outlook.com (2603:10b6:610:23::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 15 Jul 2019 21:21:38 +0000
Received: from CO1NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT028.mail.protection.outlook.com (10.152.80.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:38 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:24 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 39/87] drm/amd/display: fix DMCU hang when going into Modern
 Standby
Date: Mon, 15 Jul 2019 17:20:01 -0400
Message-ID: <20190715212049.4584-40-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(346002)(136003)(39860400002)(376002)(396003)(2980300002)(428003)(199004)(189003)(2351001)(14444005)(81166006)(2870700001)(68736007)(4326008)(1076003)(2906002)(81156014)(8936002)(8676002)(6916009)(6666004)(356004)(47776003)(53936002)(50226002)(426003)(50466002)(478600001)(2876002)(305945005)(316002)(11346002)(49486002)(5660300002)(48376002)(2616005)(51416003)(446003)(126002)(336012)(76176011)(486006)(86362001)(186003)(476003)(70206006)(70586007)(54906003)(36756003)(26005)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3928; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aec17bdc-98d1-4b2a-f0fa-08d7096a6c32
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CH2PR12MB3928; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB3928:
X-Microsoft-Antispam-PRVS: <CH2PR12MB39280180D88FF3F730DDFE5482CF0@CH2PR12MB3928.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rK4UoZsMGx06qkwZ1q//q2hNMdjXPpxpD1aDHS1vPCurZdZ7hL1fAgr/roAWSbZj8kNy90XTHCqBPQ7e07p0LbQux5XXpASm4hsb0UPvf9wcnbVrfny+a4nQMwc6soMPtKA9P859Qcqe62T/OTaiLqtbF/zmcLrtRC0jxykayOFh/MsEZsjUQgY1I+P//GCN1TAziAtJ1IddZiOcwds3VArqooaLiIKgur4C8CoWjr/dFXNMZO/6Ru4dhu0BERYEDyZDpuE2AnTr7zLC0sxaR7bRVsSQIgjj15PhrebmpGpceM0J6ZiOzz0l/3vuEumIv62v3KTcSReQFXOyGPcJm4yzislRMUpze0qSXQeyVLHn3frtPB+UqKepdO5xk59dRL1vbsh56RuQAt1FPYOiunzwL7Gjs0u4H8LvMXv9GAI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:38.0553 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aec17bdc-98d1-4b2a-f0fa-08d7096a6c32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3928
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B820o1lola00WtsTU2YhTibd2lbLcXBs5KJ6GdKRYsE=;
 b=Pj7cDkraOJaPH2jcTaWeL5HB1kToWS045BDRlwRMLYhk/EvrRPn4VIy26W5Czr5ye3ROG4qESOuJVpoxG4BBoGS7NXfVhx8wsEdzJjkULGOj9+bEYMn7mrgHEuVI0hkllzoADpyHAmVLgGl80PkPtR14ghhMq0dEstgtoab3/ac=
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
Cc: Leo Li <sunpeng.li@amd.com>, Anthony
 Koo <Anthony.Koo@amd.com>, Eric Yang <eric.yang2@amd.com>,
 Zi Yu Liao <ziyu.liao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWmkgWXUgTGlhbyA8eml5dS5saWFvQGFtZC5jb20+Cgpbd2h5XQpXaGVuIHRoZSBzeXN0
ZW0gaXMgZ29pbmcgaW50byBzdXNwZW5kLCBzZXRfYmFja2xpZ2h0IGdldHMgY2FsbGVkCmFmdGVy
IHRoZSBlRFAgZ290IGJsYW5rZWQuIFNpbmNlIHNtb290aCBicmlnaHRuZXNzIGlzIGVuYWJsZWQs
CnRoZSBkcml2ZXIgd2lsbCBtYWtlIGEgY2FsbCBpbnRvIHRoZSBETUNVIHRvIHJhbXAgdGhlIGJy
aWdodG5lc3MuClRoZSBETUNVIHdvdWxkIHRyeSB0byBlbmFibGUgQUJNIHRvIGRvIHNvLiBCdXQg
c2luY2UgdGhlIGRpc3BsYXkgaXMKYmxhbmtlZCwgdGhpcyBlbmRzIHVwIGNhdXNpbmcgQUJNMV9B
Q0VfREJVRl9SRUdfVVBEQVRFX1BFTkRJTkcgdG8KZ2V0IHN0dWNrIGF0IDEsIHdoaWNoIHJlc3Vs
dHMgaW4gYSBkZWFkIGxvY2sgaW4gdGhlIERNQ1UgZmlybXdhcmUuCgpbaG93XQpEaXNhYmxlIGJy
aWdodG5lc3MgcmFtcGluZyB3aGVuIHRoZSBlRFAgZGlzcGxheSBpcyBibGFua2VkLgoKU2lnbmVk
LW9mZi1ieTogWmkgWXUgTGlhbyA8eml5dS5saWFvQGFtZC5jb20+ClJldmlld2VkLWJ5OiBFcmlj
IFlhbmcgPGVyaWMueWFuZzJAYW1kLmNvbT4KQWNrZWQtYnk6IEFudGhvbnkgS29vIDxBbnRob255
Lktvb0BhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIHwgOSArKysrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKaW5kZXggNGI4MmI4
NmYxZTZhLi41ZDZjZjZiZGNjZjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jb3JlL2RjX2xpbmsuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rLmMKQEAgLTIzNTAsNyArMjM1MCw3IEBAIGJvb2wgZGNfbGlua19zZXRf
YmFja2xpZ2h0X2xldmVsKGNvbnN0IHN0cnVjdCBkY19saW5rICpsaW5rLAogCQkJaWYgKGNvcmVf
ZGMtPmN1cnJlbnRfc3RhdGUtPnJlc19jdHgucGlwZV9jdHhbaV0uc3RyZWFtKSB7CiAJCQkJaWYg
KGNvcmVfZGMtPmN1cnJlbnRfc3RhdGUtPnJlc19jdHguCiAJCQkJCQlwaXBlX2N0eFtpXS5zdHJl
YW0tPmxpbmsKLQkJCQkJCT09IGxpbmspCisJCQkJCQk9PSBsaW5rKSB7CiAJCQkJCS8qIERNQ1Ug
LTEgZm9yIGFsbCBjb250cm9sbGVyIGlkIHZhbHVlcywKIAkJCQkJICogdGhlcmVmb3JlICsxIGhl
cmUKIAkJCQkJICovCkBAIC0yMzU4LDYgKzIzNTgsMTMgQEAgYm9vbCBkY19saW5rX3NldF9iYWNr
bGlnaHRfbGV2ZWwoY29uc3Qgc3RydWN0IGRjX2xpbmsgKmxpbmssCiAJCQkJCQljb3JlX2RjLT5j
dXJyZW50X3N0YXRlLT4KIAkJCQkJCXJlc19jdHgucGlwZV9jdHhbaV0uc3RyZWFtX3Jlcy50Zy0+
aW5zdCArCiAJCQkJCQkxOworCisJCQkJCS8qIERpc2FibGUgYnJpZ2h0bmVzcyByYW1waW5nIHdo
ZW4gdGhlIGRpc3BsYXkgaXMgYmxhbmtlZAorCQkJCQkgKiBhcyBpdCBjYW4gaGFuZyB0aGUgRE1D
VQorCQkJCQkgKi8KKwkJCQkJaWYgKGNvcmVfZGMtPmN1cnJlbnRfc3RhdGUtPnJlc19jdHgucGlw
ZV9jdHhbaV0ucGxhbmVfc3RhdGUgPT0gTlVMTCkKKwkJCQkJCWZyYW1lX3JhbXAgPSAwOworCQkJ
CX0KIAkJCX0KIAkJfQogCQlhYm0tPmZ1bmNzLT5zZXRfYmFja2xpZ2h0X2xldmVsX3B3bSgKLS0g
CjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
