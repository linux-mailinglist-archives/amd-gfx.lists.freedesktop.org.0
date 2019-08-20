Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DFB95755
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 08:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFFC6E5E3;
	Tue, 20 Aug 2019 06:33:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720068.outbound.protection.outlook.com [40.107.72.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC00F6E5D7
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 06:33:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfCxQ5ZBhb0k6PrWUPNqiMsUWyR4muFs3vfgaDFcT5OkwMTM52iWDyosN3gfsaoLEKnmyDcgf0n49qOE5cEfomow79hv4geRcUiUufj0sIVTx29FbsxHgoM9zKZSzfn/q0n2P/em5u09Qdmg5GShvDcJuN6xpJt/QmQL2dY6hvNUxbSdW8KRfMW+uxbfDYJipjstzGh2mlAno4Da5CCIOoxoeA1KStg6Z5DERFIkbq3ykDW/PCJ88eWDlgObKsrFtBM/bnsCxtdn7KCQv1/ZN7rrc8NHIE7ix2Uaxhfruq5Dq4YWr59gS51zZD7mrVWPkub977Qeiv9SNapZ7EJvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBAugyS7dey+RrUhvMxm2EmlRNN35PPlnLSjZxZ/FEM=;
 b=gpwRAp4f8bFncZaKv2wfAJmcRKlmzbU8mccg0QrzIN0hpobn16q7rbgIROjUZpQAD70zrdAhObjscRD8ySLfvzhU8OMjxKttIEW/klFLDtsyWwLWHGtccn9LjgsoVvCAKm8S0GaT8Q/ZsY8IjmwXZQ4lifyriGazaRbgdlpTiY7TQkNaVZN5kbqKmEGNy5iiu0bnIRiTwTaKCjgrPVoXK3889xalEOFEWzd9iyZmB7eyozAc4FVJWJWrwkMx9tezBfyyl7CFjyP5DhENFuLC16HS2SkhGFxuhV2GAY75iW2g/SBoA9bysLbBRap6CdqV8vDaJoDFzpLS/xxcRTNndw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0051.namprd12.prod.outlook.com (2603:10b6:802:20::22)
 by DM5PR12MB1276.namprd12.prod.outlook.com (2603:10b6:3:79::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Tue, 20 Aug
 2019 06:33:55 +0000
Received: from BY2NAM03FT037.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by SN1PR12CA0051.outlook.office365.com
 (2603:10b6:802:20::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18 via Frontend
 Transport; Tue, 20 Aug 2019 06:33:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT037.mail.protection.outlook.com (10.152.84.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 06:33:54 +0000
Received: from lnx-kenneth.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 20 Aug 2019
 01:33:52 -0500
From: Kenneth Feng <kenneth.feng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: disable MMHUB PG on navi10/14
Date: Tue, 20 Aug 2019 14:33:48 +0800
Message-ID: <1566282828-12032-1-git-send-email-kenneth.feng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(2980300002)(428003)(189003)(199004)(4326008)(5660300002)(316002)(44832011)(16586007)(486006)(126002)(476003)(53936002)(2616005)(426003)(81166006)(81156014)(8676002)(4744005)(2351001)(50226002)(36756003)(8936002)(478600001)(186003)(336012)(26005)(53416004)(47776003)(2906002)(86362001)(50466002)(51416003)(7696005)(6666004)(305945005)(48376002)(6916009)(356004)(70586007)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1276; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51284c83-b4f2-46df-cafe-08d725385f6f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1276; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1276:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12764756732F9B75B420C8C28EAB0@DM5PR12MB1276.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-Forefront-PRVS: 013568035E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: S+2IcGrk+1xYB5BQnU10NHVr0vVEs6rQni681KPfgFJdrW3AosXJ29MhQ2ksewxWKZoJjHGf2Pks23GgynrscJG1u+DtEfRyYgO+aadAx/XGfVnM4m7ZC4ej/6POxA9ydGiZcOejg8q8GSliG0xaiVh+cdw3ZkUT0P16WOca1iWOiWHce8R+3p4VacJx7D2frXxyivhLjc3xpV6AIjFlNwUdystEBCNSF8gmkB5ECo1O+rz8EencVxqKhGxOlQmb6uxGJzEJJS3grrKrNms0GMO8pEgC8829XqrEZHOpWQEBkJjKnGxIP3NGHyRXcYyysG9T5HWyVylBY3Lxc6PcnPPklAKHKfOUC9Za+krEGh76PchCOQtgY5xccwYUo3o9B8lXsyujFGNz6+xC3YwZ4uL8ZSg6Curr4IMlwEz3mSU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 06:33:54.4161 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51284c83-b4f2-46df-cafe-08d725385f6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBAugyS7dey+RrUhvMxm2EmlRNN35PPlnLSjZxZ/FEM=;
 b=kd0l7Q0GpKQJsdo0mnv7RSoi+svjUAUaOUQLHKhOD+X+vRx3BR9Ux+P1/jUX7ajm8Q7yxcSuN9/pKYU6joJ71jHL/ETnDaJyCjujjO0qgCyDJckLzIvW9YagdrQuXR43Xbe946N1nhNZIegVs7j1TPR8D3+QwodwAizDyR4TO24=
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
Cc: Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RGlzYWJsZSBNTUhVQiBQRyBvbiBuYXZpMTAgYW5kIG5hdmkxNCBhY2NvcmRpbmcgdG8gdGhlCnBy
b2R1Y3Rpb24gcmVxdWlyZW1lbnQuCgpTaWduZWQtb2ZmLWJ5OiBLZW5uZXRoIEZlbmcgPGtlbm5l
dGguZmVuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkx
MF9wcHQuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggOTIwMTU2ZS4uOGIzMDZk
MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwpAQCAtMzYx
LDkgKzM2MSw2IEBAIG5hdmkxMF9nZXRfYWxsb3dlZF9mZWF0dXJlX21hc2soc3RydWN0IHNtdV9j
b250ZXh0ICpzbXUsCiAJCSoodWludDY0X3QgKilmZWF0dXJlX21hc2sgJj0gfkZFQVRVUkVfTUFT
SyhGRUFUVVJFX0ZXX0RTVEFURV9CSVQpOwogCX0KIAotCWlmIChzbXUtPmFkZXYtPnBnX2ZsYWdz
ICYgQU1EX1BHX1NVUFBPUlRfTU1IVUIpCi0JCSoodWludDY0X3QgKilmZWF0dXJlX21hc2sgfD0g
RkVBVFVSRV9NQVNLKEZFQVRVUkVfTU1IVUJfUEdfQklUKTsKLQogCWlmIChzbXUtPmFkZXYtPnBn
X2ZsYWdzICYgQU1EX1BHX1NVUFBPUlRfQVRIVUIpCiAJCSoodWludDY0X3QgKilmZWF0dXJlX21h
c2sgfD0gRkVBVFVSRV9NQVNLKEZFQVRVUkVfQVRIVUJfUEdfQklUKTsKIAotLSAKMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
