Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C96516F33
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2019 04:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BA26E867;
	Wed,  8 May 2019 02:46:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810087.outbound.protection.outlook.com [40.107.81.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02C26E863
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 May 2019 02:46:14 +0000 (UTC)
Received: from BN8PR12CA0028.namprd12.prod.outlook.com (20.178.208.41) by
 BYAPR12MB3477.namprd12.prod.outlook.com (20.178.196.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Wed, 8 May 2019 02:46:13 +0000
Received: from DM3NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by BN8PR12CA0028.outlook.office365.com
 (2603:10b6:408:60::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Wed, 8 May 2019 02:46:12 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT008.mail.protection.outlook.com (10.152.82.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Wed, 8 May 2019 02:46:12 +0000
Received: from bb-VirtualBox.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 7 May 2019
 21:46:09 -0500
From: Trigger Huang <Trigger.Huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 7/9] drm/amdgpu: Skip setting some regs under Vega10 VF
Date: Wed, 8 May 2019 10:45:39 +0800
Message-ID: <1557283541-7877-8-git-send-email-Trigger.Huang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557283541-7877-1-git-send-email-Trigger.Huang@amd.com>
References: <1557283541-7877-1-git-send-email-Trigger.Huang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(396003)(136003)(346002)(2980300002)(428003)(189003)(199004)(48376002)(70586007)(50466002)(2906002)(305945005)(6916009)(53416004)(72206003)(51416003)(54906003)(316002)(16586007)(36756003)(2351001)(8676002)(70206006)(356004)(486006)(478600001)(81166006)(81156014)(2616005)(86362001)(76176011)(426003)(11346002)(47776003)(126002)(186003)(336012)(4326008)(476003)(6666004)(5660300002)(53936002)(26005)(77096007)(8936002)(7696005)(446003)(68736007)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3477; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c09bc08-50c4-4598-e12b-08d6d35f5554
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BYAPR12MB3477; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB3477:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3477B1D45C433E9E276E8631FE320@BYAPR12MB3477.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: vVj34OWLHaXfPVHGv2nkkFYEC4G6muLTDpU/293n/Vz+nLlmBQMvz1oOyHrXsDxE6fAvURUJ69951HW+cFyi/mUVqshny7Y/UWKXM2FBR3wU/6IdyxhVZY0mSS30et7U7AwxGrdVrWPLMPMbIeg9A9EJolFUgpNkwgMCVLcoP7Nx3PYpFejQ5DZKkRIZXrp7SA+OnNZ/IAIAorDQoyNk05Yt7zfwUCE/Umy0PLTGvZQ/n9kURWG9lA4UZWKxewfnI65vVmy86Dj/Cr7M8Q5G4T0Q+sBbc2bnhiG/fHpEjpbw4UKRb9KZBXIjvMDvBdGX+8SGR3VdcF7x13D4F0gCR/e08z/E9fzeZUEOoX2t5K94j8TvFDTW9YB8Umc3FZ0hd4LZRv0oTPD8blsGgNOzmKHoj4iw47UhG5L8vnhuJ4k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 02:46:12.4516 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c09bc08-50c4-4598-e12b-08d6d35f5554
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3477
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4w1hrbybvPqYi65De/w9Rsrpin8IsD9Oi4VBza0PaI=;
 b=WCG1nyksZXhptVI80pzvywYbZQfVtYYZRXnRZKnhp89LMLB5k79yF25ipOkrSHZbZ9E6EnLdY9RYCvu8hpFDLkPcjYcSl5D3TTJTz16Vp5/xbDPNSzRgeWbRA479vvIPkEQx3AnqN/coHVBEdgIwtCV+O9eamxfDGFqkjn7cVeI=
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
Cc: Daniel.Wang2@amd.com, Rashid.Sohail@amd.com, Trigger.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIFZlZ2ExMCBTUi1JT1YgVkYsIHNraXAgc2V0dGluZyBzb21lIHJlZ3MgZHVlIHRvOgoxLCBo
b3N0IHdpbGwgcHJvZ3JhbSB0aG1lCjIsIGF2b2lkIFZGIHJlZ2lzdGVyIHByb2dyYW1taW5nIHZp
b2xhdGlvbnMKCkNoYW5nZS1JZDogSWQ0M2U3ZmNhNzc3NTAzNWJlNDc2OTZjNjdhNzRhZDQxODQw
MzAzNmIKU2lnbmVkLW9mZi1ieTogVHJpZ2dlciBIdWFuZyA8VHJpZ2dlci5IdWFuZ0BhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgICB8IDE0ICsrKysr
KysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jICAgfCAgMyAr
KysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzAuYyB8IDI1ICsrKysrKysr
KysrKysrKysrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5j
ICB8IDE0ICsrKysrKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5j
ICAgICAgfCAxNiArKysrKysrKysrKy0tLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlv
bnMoKyksIDIyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5j
CmluZGV4IGVmNDI3MmQuLjZiMjAzYzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dmeF92OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5
XzAuYwpAQCAtMzA3LDEyICszMDcsMTQgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfaW5pdF9nb2xk
ZW5fcmVnaXN0ZXJzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewogCXN3aXRjaCAoYWRl
di0+YXNpY190eXBlKSB7CiAJY2FzZSBDSElQX1ZFR0ExMDoKLQkJc29jMTVfcHJvZ3JhbV9yZWdp
c3Rlcl9zZXF1ZW5jZShhZGV2LAotCQkJCQkJIGdvbGRlbl9zZXR0aW5nc19nY185XzAsCi0JCQkJ
CQkgQVJSQVlfU0laRShnb2xkZW5fc2V0dGluZ3NfZ2NfOV8wKSk7Ci0JCXNvYzE1X3Byb2dyYW1f
cmVnaXN0ZXJfc2VxdWVuY2UoYWRldiwKLQkJCQkJCSBnb2xkZW5fc2V0dGluZ3NfZ2NfOV8wX3Zn
MTAsCi0JCQkJCQkgQVJSQVlfU0laRShnb2xkZW5fc2V0dGluZ3NfZ2NfOV8wX3ZnMTApKTsKKwkJ
aWYgKCFhbWRncHVfdmlydF9zdXBwb3J0X3NraXBfc2V0dGluZyhhZGV2KSkgeworCQkJc29jMTVf
cHJvZ3JhbV9yZWdpc3Rlcl9zZXF1ZW5jZShhZGV2LAorCQkJCQkJCSBnb2xkZW5fc2V0dGluZ3Nf
Z2NfOV8wLAorCQkJCQkJCSBBUlJBWV9TSVpFKGdvbGRlbl9zZXR0aW5nc19nY185XzApKTsKKwkJ
CXNvYzE1X3Byb2dyYW1fcmVnaXN0ZXJfc2VxdWVuY2UoYWRldiwKKwkJCQkJCQkgZ29sZGVuX3Nl
dHRpbmdzX2djXzlfMF92ZzEwLAorCQkJCQkJCSBBUlJBWV9TSVpFKGdvbGRlbl9zZXR0aW5nc19n
Y185XzBfdmcxMCkpOworCQl9CiAJCWJyZWFrOwogCWNhc2UgQ0hJUF9WRUdBMTI6CiAJCXNvYzE1
X3Byb2dyYW1fcmVnaXN0ZXJfc2VxdWVuY2UoYWRldiwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jCmluZGV4IDcyN2UyNmEuLmI0MTU3NGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ21jX3Y5XzAuYwpAQCAtMTA4Nyw2ICsxMDg3LDkgQEAgc3RhdGljIHZvaWQgZ21jX3Y5XzBf
aW5pdF9nb2xkZW5fcmVnaXN0ZXJzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCiAJc3dp
dGNoIChhZGV2LT5hc2ljX3R5cGUpIHsKIAljYXNlIENISVBfVkVHQTEwOgorCQlpZiAoYW1kZ3B1
X3ZpcnRfc3VwcG9ydF9za2lwX3NldHRpbmcoYWRldikpCisJCQlicmVhazsKKwkJLyogZmFsbCB0
aHJvdWdoICovCiAJY2FzZSBDSElQX1ZFR0EyMDoKIAkJc29jMTVfcHJvZ3JhbV9yZWdpc3Rlcl9z
ZXF1ZW5jZShhZGV2LAogCQkJCQkJZ29sZGVuX3NldHRpbmdzX21taHViXzFfMF8wLApkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5jCmluZGV4IDE3NDEwNTYuLjgwNTQxMzEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMKQEAgLTExMSw2ICsxMTEsOSBA
QCBzdGF0aWMgdm9pZCBtbWh1Yl92MV8wX2luaXRfc3lzdGVtX2FwZXJ0dXJlX3JlZ3Moc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCVdSRUczMl9TT0MxNShNTUhVQiwgMCwgbW1NQ19WTV9T
WVNURU1fQVBFUlRVUkVfSElHSF9BRERSLAogCQkJICAgICBtYXgoYWRldi0+Z21jLmZiX2VuZCwg
YWRldi0+Z21jLmFncF9lbmQpID4+IDE4KTsKIAorCWlmIChhbWRncHVfdmlydF9zdXBwb3J0X3Nr
aXBfc2V0dGluZyhhZGV2KSkKKwkJcmV0dXJuOworCiAJLyogU2V0IGRlZmF1bHQgcGFnZSBhZGRy
ZXNzLiAqLwogCXZhbHVlID0gYWRldi0+dnJhbV9zY3JhdGNoLmdwdV9hZGRyIC0gYWRldi0+Z21j
LnZyYW1fc3RhcnQgKwogCQlhZGV2LT52bV9tYW5hZ2VyLnZyYW1fYmFzZV9vZmZzZXQ7CkBAIC0x
NTYsNiArMTU5LDkgQEAgc3RhdGljIHZvaWQgbW1odWJfdjFfMF9pbml0X2NhY2hlX3JlZ3Moc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJdWludDMyX3QgdG1wOwogCisJaWYgKGFtZGdw
dV92aXJ0X3N1cHBvcnRfc2tpcF9zZXR0aW5nKGFkZXYpKQorCQlyZXR1cm47CisKIAkvKiBTZXR1
cCBMMiBjYWNoZSAqLwogCXRtcCA9IFJSRUczMl9TT0MxNShNTUhVQiwgMCwgbW1WTV9MMl9DTlRM
KTsKIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgVk1fTDJfQ05UTCwgRU5BQkxFX0wyX0NBQ0hF
LCAxKTsKQEAgLTIwMSw2ICsyMDcsOSBAQCBzdGF0aWMgdm9pZCBtbWh1Yl92MV8wX2VuYWJsZV9z
eXN0ZW1fZG9tYWluKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCiBzdGF0aWMgdm9pZCBt
bWh1Yl92MV8wX2Rpc2FibGVfaWRlbnRpdHlfYXBlcnR1cmUoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCiB7CisJaWYgKGFtZGdwdV92aXJ0X3N1cHBvcnRfc2tpcF9zZXR0aW5nKGFkZXYpKQor
CQlyZXR1cm47CisKIAlXUkVHMzJfU09DMTUoTU1IVUIsIDAsIG1tVk1fTDJfQ09OVEVYVDFfSURF
TlRJVFlfQVBFUlRVUkVfTE9XX0FERFJfTE8zMiwKIAkJICAgICAwWEZGRkZGRkZGKTsKIAlXUkVH
MzJfU09DMTUoTU1IVUIsIDAsIG1tVk1fTDJfQ09OVEVYVDFfSURFTlRJVFlfQVBFUlRVUkVfTE9X
X0FERFJfSEkzMiwKQEAgLTMzNywxMSArMzQ2LDEzIEBAIHZvaWQgbW1odWJfdjFfMF9nYXJ0X2Rp
c2FibGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCQkJMCk7CiAJV1JFRzMyX1NPQzE1
KE1NSFVCLCAwLCBtbU1DX1ZNX01YX0wxX1RMQl9DTlRMLCB0bXApOwogCi0JLyogU2V0dXAgTDIg
Y2FjaGUgKi8KLQl0bXAgPSBSUkVHMzJfU09DMTUoTU1IVUIsIDAsIG1tVk1fTDJfQ05UTCk7Ci0J
dG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIFZNX0wyX0NOVEwsIEVOQUJMRV9MMl9DQUNIRSwgMCk7
Ci0JV1JFRzMyX1NPQzE1KE1NSFVCLCAwLCBtbVZNX0wyX0NOVEwsIHRtcCk7Ci0JV1JFRzMyX1NP
QzE1KE1NSFVCLCAwLCBtbVZNX0wyX0NOVEwzLCAwKTsKKwlpZiAoIWFtZGdwdV92aXJ0X3N1cHBv
cnRfc2tpcF9zZXR0aW5nKGFkZXYpKSB7CisJCS8qIFNldHVwIEwyIGNhY2hlICovCisJCXRtcCA9
IFJSRUczMl9TT0MxNShNTUhVQiwgMCwgbW1WTV9MMl9DTlRMKTsKKwkJdG1wID0gUkVHX1NFVF9G
SUVMRCh0bXAsIFZNX0wyX0NOVEwsIEVOQUJMRV9MMl9DQUNIRSwgMCk7CisJCVdSRUczMl9TT0Mx
NShNTUhVQiwgMCwgbW1WTV9MMl9DTlRMLCB0bXApOworCQlXUkVHMzJfU09DMTUoTU1IVUIsIDAs
IG1tVk1fTDJfQ05UTDMsIDApOworCX0KIH0KIAogLyoqCkBAIC0zNTMsNiArMzY0LDEwIEBAIHZv
aWQgbW1odWJfdjFfMF9nYXJ0X2Rpc2FibGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB2
b2lkIG1taHViX3YxXzBfc2V0X2ZhdWx0X2VuYWJsZV9kZWZhdWx0KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCBib29sIHZhbHVlKQogewogCXUzMiB0bXA7CisKKwlpZiAoYW1kZ3B1X3ZpcnRf
c3VwcG9ydF9za2lwX3NldHRpbmcoYWRldikpCisJCXJldHVybjsKKwogCXRtcCA9IFJSRUczMl9T
T0MxNShNTUhVQiwgMCwgbW1WTV9MMl9QUk9URUNUSU9OX0ZBVUxUX0NOVEwpOwogCXRtcCA9IFJF
R19TRVRfRklFTEQodG1wLCBWTV9MMl9QUk9URUNUSU9OX0ZBVUxUX0NOVEwsCiAJCQlSQU5HRV9Q
Uk9URUNUSU9OX0ZBVUxUX0VOQUJMRV9ERUZBVUxULCB2YWx1ZSk7CmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NkbWFfdjRfMC5jCmluZGV4IDg2OTFiNjIuLjIzM2I3ZjQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCkBAIC0yMTIsMTIgKzIxMiwxNCBAQCBzdGF0aWMgdm9p
ZCBzZG1hX3Y0XzBfaW5pdF9nb2xkZW5fcmVnaXN0ZXJzKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQogewogCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CiAJY2FzZSBDSElQX1ZFR0ExMDoK
LQkJc29jMTVfcHJvZ3JhbV9yZWdpc3Rlcl9zZXF1ZW5jZShhZGV2LAotCQkJCQkJIGdvbGRlbl9z
ZXR0aW5nc19zZG1hXzQsCi0JCQkJCQkgQVJSQVlfU0laRShnb2xkZW5fc2V0dGluZ3Nfc2RtYV80
KSk7Ci0JCXNvYzE1X3Byb2dyYW1fcmVnaXN0ZXJfc2VxdWVuY2UoYWRldiwKLQkJCQkJCSBnb2xk
ZW5fc2V0dGluZ3Nfc2RtYV92ZzEwLAotCQkJCQkJIEFSUkFZX1NJWkUoZ29sZGVuX3NldHRpbmdz
X3NkbWFfdmcxMCkpOworCQlpZiAoIWFtZGdwdV92aXJ0X3N1cHBvcnRfc2tpcF9zZXR0aW5nKGFk
ZXYpKSB7CisJCQlzb2MxNV9wcm9ncmFtX3JlZ2lzdGVyX3NlcXVlbmNlKGFkZXYsCisJCQkJCQkJ
IGdvbGRlbl9zZXR0aW5nc19zZG1hXzQsCisJCQkJCQkJIEFSUkFZX1NJWkUoZ29sZGVuX3NldHRp
bmdzX3NkbWFfNCkpOworCQkJc29jMTVfcHJvZ3JhbV9yZWdpc3Rlcl9zZXF1ZW5jZShhZGV2LAor
CQkJCQkJCSBnb2xkZW5fc2V0dGluZ3Nfc2RtYV92ZzEwLAorCQkJCQkJCSBBUlJBWV9TSVpFKGdv
bGRlbl9zZXR0aW5nc19zZG1hX3ZnMTApKTsKKwkJfQogCQlicmVhazsKIAljYXNlIENISVBfVkVH
QTEyOgogCQlzb2MxNV9wcm9ncmFtX3JlZ2lzdGVyX3NlcXVlbmNlKGFkZXYsCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc29jMTUuYwppbmRleCA5MTUwZTkzLi40YjdkY2FhIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NvYzE1LmMKQEAgLTk5NSwxMSArOTk1LDE3IEBAIHN0YXRpYyB2b2lkIHNvYzE1X2Rv
b3JiZWxsX3JhbmdlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJaW50IGk7CiAJ
c3RydWN0IGFtZGdwdV9yaW5nICpyaW5nOwogCi0JZm9yIChpID0gMDsgaSA8IGFkZXYtPnNkbWEu
bnVtX2luc3RhbmNlczsgaSsrKSB7Ci0JCXJpbmcgPSAmYWRldi0+c2RtYS5pbnN0YW5jZVtpXS5y
aW5nOwotCQlhZGV2LT5uYmlvX2Z1bmNzLT5zZG1hX2Rvb3JiZWxsX3JhbmdlKGFkZXYsIGksCi0J
CQlyaW5nLT51c2VfZG9vcmJlbGwsIHJpbmctPmRvb3JiZWxsX2luZGV4LAotCQkJYWRldi0+ZG9v
cmJlbGxfaW5kZXguc2RtYV9kb29yYmVsbF9yYW5nZSk7CisJLyogIFR3byByZWFzb25zIHRvIHNr
aXAKKwkqCQkxLCBIb3N0IGRyaXZlciBhbHJlYWR5IHByb2dyYW1tZWQgdGhlbQorCSoJCTIsIFRv
IGF2b2lkIHJlZ2lzdGVycyBwcm9ncmFtIHZpb2xhdGlvbnMgaW4gU1ItSU9WCisJKi8KKwlpZiAo
IWFtZGdwdV92aXJ0X3N1cHBvcnRfc2tpcF9zZXR0aW5nKGFkZXYpKSB7CisJCWZvciAoaSA9IDA7
IGkgPCBhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXM7IGkrKykgeworCQkJcmluZyA9ICZhZGV2LT5z
ZG1hLmluc3RhbmNlW2ldLnJpbmc7CisJCQlhZGV2LT5uYmlvX2Z1bmNzLT5zZG1hX2Rvb3JiZWxs
X3JhbmdlKGFkZXYsIGksCisJCQkJcmluZy0+dXNlX2Rvb3JiZWxsLCByaW5nLT5kb29yYmVsbF9p
bmRleCwKKwkJCQlhZGV2LT5kb29yYmVsbF9pbmRleC5zZG1hX2Rvb3JiZWxsX3JhbmdlKTsKKwkJ
fQogCX0KIAogCWFkZXYtPm5iaW9fZnVuY3MtPmloX2Rvb3JiZWxsX3JhbmdlKGFkZXYsIGFkZXYt
PmlycS5paC51c2VfZG9vcmJlbGwsCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
