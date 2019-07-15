Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F07269DA7
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E6F89C17;
	Mon, 15 Jul 2019 21:21:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF8E89C14
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5QCaAwbHz/Bva8sMwYIWrbvMm+eH/bfPFw3GRIhA02m+hUK3M5Ieov8SsMXHspsKtQ9dnsloH1z60SrE3KNVoLpr99bwyvOMigezkIQYvRBKmeHsWyz8MSTinh/POodNf2BJWqxkpNojCxryCI8e2rJJj01iOb8RR6Nxc7Rx1OXbfPVlHIe/pYOaMN0uLD4Rz2QUGuP//B8H43oME0CqgzdkMe8FB9xmx1Aq3XDlDoQeFwpKiGal3tr0sXZFVobCDzbzQrTgOgiPMAmJuYR3HN9MG27W9/YkQPYXeUxfpuJMma5MMCdBR2Bkk8uFukZDyBYGAKYA0WmEt9NKH2quQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdxV77JJXbzJvw3EjMpU8VdiHgvTxMRNp4gNt3l1QYc=;
 b=YBH2Z/U/4aZg+E7cXiuyrjAFsA4ZH/bvfCRFEhHCxzsa/YCe+zFpbEtWh5kEmTkZvoljlMpj4kOpkREcidksoWQWH9/L4Xj2+dlIrDUjnIPOTkCAK3dkL9FU7YdbGZgb1tn9NsK2IdP1DPzDsMLpbO10QOSbZoNcDbc2NTrO5hZffuf5oZTNg8p4bt8ho+EmypNLhVft3SeZueABPVLZXa6LiPC2oYensZ0Q8zxeZfaeooGJPKesFKQJ7Mzl0XYQ0q6oShrveBkyvU55di2x2TLbzU+iJ64eFY5rA/AXRro6RE43JgItHhROzYDR+a705RUrkwBuILaHMZAUOrQ/Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 MN2PR12MB3934.namprd12.prod.outlook.com (2603:10b6:208:16a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.13; Mon, 15 Jul
 2019 21:21:28 +0000
Received: from CO1NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT028.mail.protection.outlook.com (10.152.80.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:27 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:17 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 23/87] drm/amd/display: wait for the whole frame after global
 unlock
Date: Mon, 15 Jul 2019 17:19:45 -0400
Message-ID: <20190715212049.4584-24-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(76176011)(86362001)(1076003)(36756003)(8676002)(186003)(336012)(26005)(2351001)(11346002)(426003)(51416003)(446003)(305945005)(48376002)(476003)(126002)(2870700001)(478600001)(6916009)(2906002)(2876002)(50466002)(53936002)(2616005)(4326008)(6666004)(316002)(50226002)(54906003)(486006)(14444005)(356004)(47776003)(49486002)(5660300002)(70206006)(70586007)(81166006)(8936002)(68736007)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3934; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 672e4949-f17e-41f1-c6c7-08d7096a65e2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3934; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3934:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3934AB6F3E4BB9B2D947D86082CF0@MN2PR12MB3934.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 4oTKC4ToWhtLTlZbz/D40zPIvUc+Sda6mZCyTKtqEOH8n+uhrcESG+sUrxWk/5wtqjA2nUyaADOcpX5Kl7FoAaBHSO4MIBNP/TsRFpbI6lCnTaA1sIhJvU3LvbnURrprLv3j1p4T0b5DjTBYbSTx7y7cbisNwJ3hwG0VMQYDXk+L22TRDUVSm+9nvpxmVUA1Z9SP+ZEvx4b1cDxabj4OLdVYTFPe+NJ4pQF/t1vxOLK8WSsB88i4EAHYJzPVLizNCPKWyeswALP2enilFatF36l0kwYSXgdyVMY5ATMuQoLtmHkCW2uiyp7d0FVzg1YGXEM8tsNsLHWESKY2TxwlvE0l5KBrrjiYHwEjnGOD2zZriMPtDqiYSaRX2+14uWtvZlCDwz4OVZQLjZHY7d2vAVwscizAsMWgraGdsWBIHrw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:27.4827 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 672e4949-f17e-41f1-c6c7-08d7096a65e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3934
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdxV77JJXbzJvw3EjMpU8VdiHgvTxMRNp4gNt3l1QYc=;
 b=DUAGi9rkmCoBf/F4IgBju+ZJ66ZpiHwV1Em33mI9n+bsMAjWpdbJujqp9S4b5BkwBHv5Q1GUFbD1NDvI4ruMDFo+P8Y0S5YaUuMXyQmR4eoTE373rEHkxJcVrJc7VkO3PcLEzPeD3R6bgjC0d8TbWwFIOz9qRq5gilj0Y6AgBOI=
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
Cc: Leo Li <sunpeng.li@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+Cgpbd2h5XQpUaGUgY3VycmVu
dCBjb2RlIHdpbGwgbm90IHdhaXQgZm9yIHRoZSBlbnRpcmUgZnJhbWUKIGFmdGVyIGdsb2JhbCB1
bmxvY2suClRoaXMgY2F1c2VzIGRzYyBkeW5hbWljIHRhcmdldCBicHAgdXBkYXRlIGNvcnJ1cHRp
b24gd2hlbgp0aGVyZSBpcyBhIHN1cmZhY2UgdXBkYXRlIGltbWVkaWF0ZWx5IGhhcHBlbnMgYWZ0
ZXIgdGhpcy4KCltob3ddCldhaXQgZm9yIHRoZSBlbnRpcmUgd2hvbGUgZnJhbWUgYWZ0ZXIgdW5s
b2NrIGJlZm9yZSBjb250aW51aW5nCnRoZSByZXN0IG9mIHN0cmVhbSBhbmQgc3VyZmFjZSB1cGRh
dGUuCgpTaWduZWQtb2ZmLWJ5OiBXZW5qaW5nIExpdSA8V2VuamluZy5MaXVAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEp1biBMZWkgPEp1bi5MZWlAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3Vu
cGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9od3NlcS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9o
d3NlcS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2Vx
LmMKaW5kZXggZjgyMGU5NjY3ZTNjLi43YzA4ZjgxMDAwYzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCkBAIC0xMjU2LDYgKzEy
NTYsOCBAQCB2b2lkIGRjbjIwX3BpcGVfY29udHJvbF9sb2NrX2dsb2JhbCgKIAkJCQlDUlRDX1NU
QVRFX1ZBQ1RJVkUpOwogCQlwaXBlLT5zdHJlYW1fcmVzLnRnLT5mdW5jcy0+d2FpdF9mb3Jfc3Rh
dGUocGlwZS0+c3RyZWFtX3Jlcy50ZywKIAkJCQlDUlRDX1NUQVRFX1ZCTEFOSyk7CisJCXBpcGUt
PnN0cmVhbV9yZXMudGctPmZ1bmNzLT53YWl0X2Zvcl9zdGF0ZShwaXBlLT5zdHJlYW1fcmVzLnRn
LAorCQkJCUNSVENfU1RBVEVfVkFDVElWRSk7CiAJCXBpcGUtPnN0cmVhbV9yZXMudGctPmZ1bmNz
LT5sb2NrX2RvdWJsZWJ1ZmZlcl9kaXNhYmxlKAogCQkJCXBpcGUtPnN0cmVhbV9yZXMudGcpOwog
CX0KLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
